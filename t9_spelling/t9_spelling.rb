class T9Speller
  attr_accessor :lines
  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
  end

end