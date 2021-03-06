class Milkshake

  attr_accessor :lines, :cases

  def initialize(input)
    @lines = input.map { |line| line.chomp }
  end

  def output
    parse.each_with_index.map do |kase, i|
      "Case ##{i + 1}: #{kase.mix}"
    end
  end

  def parse
    cases = @lines.shift.to_i
    cases.times.map do
      Kase.new @lines
    end
  end

  class Kase
    attr_accessor :flavors, :customer_count, :customers

    def initialize(lines)
      @flavors = lines.shift.to_i
      @customer_count = lines.shift.to_i
      customer_info = lines.shift(@customer_count)
      @customers = set_customers(customer_info)
    end

    def mix
      output = Array.new(@flavors, nil)
      @customers.each do |preferences|
        picked = false
        preferences.each do |flavor, malted|
          flavor_index = flavor.to_i - 1
          if output[flavor_index] == malted
            picked = true
            break
          elsif output[flavor_index]
            next
          else
            picked = true
            output[flavor_index] = malted
            break
          end
        end
        return "IMPOSSIBLE" unless picked
      end
      output = output.map do |x|
        x = 0 if !x
        x
      end
      output.join(" ")
    end

    def set_customers(lines)
      array = lines.map { |line| line.split(" ") }
      array.map do |person|
        preferences = person[1..-1].each_slice(2).to_a
        preferences.sort_by do |flavor, malted|
          malted
        end
      end
    end
  end
end

lines = ARGF.each_line
milkshake = Milkshake.new lines
puts milkshake.output