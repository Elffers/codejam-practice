class StoreCredit
  def initialize(lines)
    @array = lines.split(/\n/)
  end

  def parse
    @array.shift
    @array.each_slice(3).map { |x| [x.first.to_i, prices(x.last)] }
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

  def find_items(sum, prices)
    # O(n)
    prices.each_with_index do |price, index|
      complement = sum - price
      # O(n)
      if price == complement && prices.count(price) == 2
        return find_all_index(price, prices)
        # O(n)
      elsif prices.include? complement
        return index + 1 , prices.find_index(complement) + 1
      end
    end
  end

  def find_all_index(value, array)
    indices = []
    array.each_with_index { |el, i| indices << i + 1 if el == value}
    indices
  end

  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end
end

# lines = ARGF.lines.to_a
#  input = StoreCredit.new