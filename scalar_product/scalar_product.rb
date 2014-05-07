class ScalarProduct
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
    @lines.shift
  end

  def parse
    lines = @lines.each_slice(3).map { |array| [array[1], array[2]] }
    lines.map {|line| int_array(line) }
  end

  def minimum(line)
    first = line.first.sort
    last = line.last.sort.reverse
    product(first, last)
  end

  def int_array(line)
    line.map do |str|
      str.split(/\s/).map { |num| num.to_i }
    end
  end

  def product(array1, array2)
    zip = array1.zip(array2)
    zip.map{ |x| x.first * x.last }.reduce(:+)
  end

  def output
    parse.each_with_index.map do |line, i|
      "Case ##{i + 1}: #{minimum line}"
    end
  end
end

lines = ARGF.each_line
scalar = ScalarProduct.new lines
puts scalar.output