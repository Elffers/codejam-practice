require 'pry'
class Flipper

  attr_accessor :lines

  def initialize(input)
    input.shift
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.map do |stack|
      count_flips stack.chars
    end
  end

  def count_flips(stack, flips=0)
    if stack.empty?
      return flips
    end
    bottom = stack.last
    if bottom == "+"
      stack.pop
    else
      flips += 1
      stack = flip stack
      count_flips stack, flips
    end
    count_flips stack, flips
  end

  def flip stack
    stack.map do |p|
      p == "-" ? "+" : "-"
    end
  end

  def output
    parse.each_with_index.map do |out, i|
      "Case ##{i + 1}: #{out}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.readlines
  flipper = Flipper.new lines
  puts flipper.output
end
