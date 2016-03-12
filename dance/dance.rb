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
    a = dance(dancers, turns)
    i = a.find_index(target)
    # account for wrap around
    right = (i + 1) % dancers
    left = (i - 1)
    [a[right], a[left]].join(" ")
  end

  def dance dancers, turns
    dancers = (1..dancers).to_a
    turns = (1..turns).to_a
    turns.each do |turn|
      if turn.odd?
      dancers = swap_odd dancers
      else
        dancers = swap_even dancers
      end
    end
    dancers
  end

  def swap_odd dancers
    dancers.each_slice(2).flat_map do |(a, b)|
      [b, a]
    end
  end

  def swap_even dancers
    last = dancers.pop
    new = dancers.unshift last

    swapped = swap_odd new

    first = swapped.shift
    swapped << first
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
