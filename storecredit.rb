# lines = ARGF.lines.to_a

class StoreCredit
  def initialize(lines)
    @array = lines.split(/\n/)
  end

  def parse
    @array.shift
    @array.each_slice(3).map { |x|[x.first.to_i, prices(x.last)] }
  end

  def output
    cases = self.parse
    output = {}
    cases.each_with_index do |kase, i|
      output[i+1] =  find_items kase.first, kase.last
    end
    # p "parsed cases", cases
    output
  end

  def find_items(sum, prices)
    prices.each_with_index do |item, index|
      complement = sum - item
      if prices.include? complement
        return index + 1 , prices.find_index(complement) + 1
      end
    end
  end

  private
  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end

end