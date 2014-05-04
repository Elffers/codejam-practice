# lines = ARGF.lines.to_a

class StoreCredit
  def initialize(lines)
    @array = lines.split(/\n/)
  end

  def parse
    @array.shift
    @array.each_slice(3).map {|x|[x.first.to_i, prices(x.last)] }
  end

  def find_items
    cases = self.parse
    cases.map do |kase|
      "Case #1: 2 3"
    end
  end

  private
  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end

end