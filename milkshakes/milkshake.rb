class Milkshake

  attr_accessor :lines, :cases

  def initialize(input)
    @lines = input.map { |line| line.delete("\n") }
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

    def set_customers(lines)
      # ["1 1 1", "2 1 0 2 0", "1 5 0"]
      array = lines.map { |line| line.split(" ") }
      array.map do |person|
        preferences = person[1..-1].each_slice(2).to_a
        customer = {}
        customer[person.first] = preferences
        customer
      end
    end
  end
end