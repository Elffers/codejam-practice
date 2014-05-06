class T9Speller
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.shift
    @lines
  end

  def t9(string)
    k = Keypad.new
    output = []
    char_array = string.chars
    char_array.each_with_index do |char, i|
      if k.key_for(char) == k.key_for(char_array[i + 1])
        output << k.keystroke(char) + " "
      else
        output << k.keystroke(char)
      end
    end
    output.join("")
  end

  def output
    parse.each_with_index.map do |line, i|
      "Case ##{i + 1}: #{t9 line}"
    end
  end

  class Keypad
    attr_accessor :keypad

    def initialize
      @keypad = {}
      @keypad["2"] = %w[a b c]
      @keypad["3"] = %w[d e f]
      @keypad["4"] = %w[g h i]
      @keypad["5"] = %w[j k l]
      @keypad["6"] = %w[m n o]
      @keypad["7"] = %w[p q r s]
      @keypad["8"] = %w[t u v]
      @keypad["9"] = %w[w x y z]
      @keypad["0"] = [" "]
      @keypad
    end

    def keystroke(letter)
      key = key_for(letter)
      reps = @keypad[key].index(letter) + 1
      key * reps
    end

    def key_for(letter)
      @keypad.values.each do |array|
        return @keypad.key(array) if array.include? letter
      end
    end
  end
end

lines = ARGF.each_line
speller = T9Speller.new lines
puts speller.output