class Milkshake

  attr_accessor :lines, :cases

  def initialize(input)
    @lines = input.map { |line| line.chomp }
  end

  def output
    <<-OUTPUT.split "\n", 3
Case #1: 1 0 0 0 0
Case #2: IMPOSSIBLE
    OUTPUT
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
      # [{"1"=>[["1", "1"]]}, {"2"=>[["1", "0"], ["2", "0"]]}, {"1"=>[["5", "0"]]}]
      return "IMPOSSIBLE" if @flavors == 1

      output = Array.new(@flavors, 0)
      @customers.each do |customer|
        customer.each do |flavor, malted|
          if malted == "0"
            next
          else
            output[flavor.to_i - 1] = "1"
          end
        end
      end
      output.join(" ")
    end

    def set_customers(lines)
      # ["1 1 1", "2 1 0 2 0", "1 5 0"]
      array = lines.map { |line| line.split(" ") }
      array.map do |person|
        person[1..-1].each_slice(2).to_a
      end
    end
  end
end