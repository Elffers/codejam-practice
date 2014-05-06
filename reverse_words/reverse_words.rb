class Reverser
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.shift
    @lines
  end
end