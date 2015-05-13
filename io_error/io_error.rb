class IOError
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.shift
    bytes = @lines.map { |line| line.gsub(/I/, "1").gsub(/O/, "0") }
    output = []
    bytes.each_slice(2) do |slice|
      num = slice.first
      bits = slice.last
      temp = []
      bits.chars.each_slice(bits.length/num.to_i) do |x|
        temp.push x.join
      end
      output.push temp
    end
    output
  end

  def translate(bytes)
    bytes.map do |byte|
      byte.to_i(2).chr
    end.join
  end

  def output
    parse.each_with_index.map do |bytes, i|
      "Case ##{i + 1}: #{translate bytes}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.each_line
  io = IOError.new lines
  puts io.output
end
