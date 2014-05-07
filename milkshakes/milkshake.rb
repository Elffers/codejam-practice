class Milkshake

  attr_accessor :lines, :cases

  def initialize(input)
    lines = input.map { |line| line.delete("\n") }
    @cases = lines.shift
    @lines = lines
  end

  def parse
    # [Kase.new, Kase.new]
  end

  class Kase
    attr_accessor :flavors, :customer_count, :customers
    def initialize(lines)
      @flavors = lines.first
      @customer_count = lines[1]
      customer_info = lines[2..-1]
      @customers = set_customers(customer_info)
    end

    def set_customers(lines)
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