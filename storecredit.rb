# lines = ARGF.lines.to_a

class StoreCredit
  def initialize(lines)
    @lines = lines
  end

  def parse
    array = @lines.split(/\n/)
    array.shift
    parsed = []
    array.each_slice(3){|x| parsed << [x.first.to_i, prices(x.last)] }
    parsed
  end

  def prices(string)
    string.split(/\s/).map {|el| el.to_i}
  end

end