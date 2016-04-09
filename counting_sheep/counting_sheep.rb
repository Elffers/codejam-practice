class Counter
  attr_accessor :lines

  def initialize(input)
    input.shift
    @lines = input.map { |line| line.delete("\n").to_i }
  end

  def parse
    @lines.map do |num|
      count_sheep num
    end
  end

  def count_sheep num
    if num == 0
      return "INSOMNIA"
    end
    digits = Hash.new 0
    n = 1
    while !seen_all_digits?(digits)
      current = num * n
      (current).to_s.chars.each do |digit|
        digits[digit] += 1
      end
      n += 1
    end
    current
  end

  def seen_all_digits? hash
    hash.keys.count == 10
  end

  def output
    parse.each_with_index.map do |out, i|
      "Case ##{i + 1}: #{out}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.readlines
  counter = Counter.new lines
  puts counter.output
end
