class StoreCredit
  attr_accessor :lines

  # lines is input as an array from ARGF.each_line
  def initialize(lines)
    @lines = lines.map { |line| line.delete('\n') }
  end

  class InputError < RuntimeError
  end

  def parse
    if @lines.count < 4
      raise InputError
    else
      @lines.shift
      @lines.each_slice(3).map { |x| [x.first.to_i, prices(x.last)] }
    end
  end

  def output
    cases = self.parse
    output = {}
    cases.each_with_index do |kase, i|
      output[i + 1] =  find_items kase.first, kase.last
    end
    messages = []
    output.each_pair do |k, v|
      messages << "Case ##{k}: #{v.join(" ")}"
    end
    messages
  end

  # Returns array of indexes of prices whose sum equals the given sum
  def find_items(sum, prices)
    # O(n)
    prices.each_with_index do |price, index|
      complement = sum - price
      # O(n)
      if price == complement && prices.count(price) == 2
        return find_all_index(price, prices)
        # O(n)
      elsif price == complement && prices.count(price) == 1
        next
      elsif prices.include? complement
        return index + 1 , prices.find_index(complement) + 1
      end
    end
  end

  def find_all_index(value, array)
    array.each_with_index.map { |el, i| i + 1 if el == value}.compact
  end

  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end
end

lines = ARGF.each_line
input = StoreCredit.new lines
input.output.each do |message|
  p message
end

