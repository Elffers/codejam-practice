require 'pry'
class Dance
  attr_accessor :lines

  def initialize(input)
    input.shift
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.map do |line|
      find_partners(line)
    end
  end

  def find_partners line
    dancers, target, turns = line.split.map { |x| x.to_i }
    arrangement = dance(dancers, turns)
    new_target_index = arrangement[target]
    rindex = (new_target_index + 1) % dancers.to_i
    lindex = (new_target_index - 1) % dancers.to_i
    right = arrangement.key(rindex)
    left = arrangement.key(lindex)
    [right, left].join(" ")
  end

  def dance num_dancers, turns
    rotations = turns % num_dancers
    dancers = (1..num_dancers).to_a
    new_arrangement = {}
    dancers.map do |d|
      if d.odd?
        new_arrangement[d] = (d + rotations - 1) % num_dancers
      else
        new_arrangement[d] = (d - rotations - 1) % num_dancers
      end
    end
    new_arrangement
  end

  def arrangement(hash)
    array = []
    hash.each do |k, v|
      array[v] = k
    end
    array
  end

  def output
    parse.each_with_index.map do |partners, i|
      "Case ##{i + 1}: #{partners}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.readlines
  sale = Dance.new lines
  puts sale.output
end
