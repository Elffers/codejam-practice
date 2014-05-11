class Saturnalia

  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.chomp }
  end

  def parse
    @lines.shift
    @lines
  end

  def format_message(message)
    length = message.size + 2
    border = "+" + "-"*length + "+" + "\n"
    message = [border, "| " + message + " |\n", border].join("")
  end

# p all_first_days(1900, ARGV[0].to_i).count(0)

  def output
    parse.each_with_index.map do |message, i|
      "Case ##{i + 1}:\n#{format_message(message)}"
    end
  end
end

lines = ARGF.each_line
saturnalia = Saturnalia.new lines
puts saturnalia.output