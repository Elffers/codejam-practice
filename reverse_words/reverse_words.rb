class Reverser
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.shift
    @lines.map { |line| line.split(/\s/) }
  end

  def reverse(array)
    return array.first if array.length == 1
    last_index = array.length - 1
    rev = []
    while last_index >= 0
      rev << array[last_index]
      last_index -= 1
    end
    rev.join(" ")
  end

  def output
    parse.each_with_index.map do |line, i|
      "Case ##{i + 1}: #{reverse line}"
    end
  end
end

lines = ARGF.each_line
reverser = Reverser.new lines
reverser.output.each {|line| p line }