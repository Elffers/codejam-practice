require 'pry'
class Dreary
  attr_accessor :lines

  def initialize input
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.shift
    @lines
  end

  def combinations(line)
    k, v = line.split(" ").map { |el| el.to_i }

    if v == 0
      return k + 1
    elsif k == v
      return (k + 1)**3
    end

    permutations = (0..k).to_a.repeated_permutation(3).to_a
    combos = permutations.map do |perm|
      perm.combination(2).to_a
    end
    combos.select! do |combo|
      combo.all? { |c| (c.first - c.last).abs <= v }
    end
    combos.count
  end

  def output
    parse.each_with_index.map do |line, i|
      "Case ##{i + 1}: #{combinations line}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.each_line
  dreary = Dreary.new lines
  puts dreary.output
end

