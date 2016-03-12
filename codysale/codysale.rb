require 'pry'
class Sale
  attr_accessor :lines

  def initialize(input)
    input.shift
    @lines = input.map { |line| line.delete("\n") }
  end

  def parse
    @lines.each_slice(2).map do |(items, prices)|
      find_sale_prices(items.to_i, prices)
    end
  end

  def find_sale_prices items, prices
    r = prices.split.map { |p| p.to_i }.reverse
    # iterate in reverse order
    sales = []
    r.each do |price|
      sale = 0.75 * price
      sales.unshift sale
      i = r.find_index(sale)
      r.delete_at(i)
    end
    sales.map { |x| x.to_i }.join(" ")
  end

  def output
    parse.each_with_index.map do |prices, i|
      "Case ##{i + 1}: #{prices}"
    end
  end
end

if $0 == __FILE__
  lines = ARGF.readlines
  sale = Sale.new lines
  puts sale.output
end
