class ScalarProduct
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
    @lines.shift
    @lines
  end

  def parse
    @lines.each_slice(3).map {|array| [array[1], array[2]]}
  end
end