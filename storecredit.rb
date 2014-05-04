# lines = ARGF.lines.to_a

class StoreCredit
  def initialize(lines)
    @lines = lines
  end

  def parse
    array = @lines.split(/\n/)
    array.shift
    array.each_slice(3).map {|x|[x.first.to_i, prices(x.last)] }
  end

  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end

end