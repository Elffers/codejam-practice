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
    # [[1, 3, -5], [-2, 4, 1]]
    prods = []
    first = line.first.permutation.to_a
    last = line.last.permutation.to_a
    first.each do |array1|
      last.each do |array2|
        prods << product(array1, array2)
      end
    end
    prods.min
  end

  def int_array(line)
    line.map do |str|
      str.split(/\s/).map { |num| num.to_i }
    end
  end

  def product(array1, array2)
    zip = array1.zip(array2)
    zip.map{|x| x.first * x.last }.reduce(:+)
  end
end