class Zathras
  attr_accessor :lines

  def initialize(input)
    @lines = input.map { |line| line.chomp }
  end

  def parse
    @lines.shift
    @lines.map {|x| x.split.map { |n| n.to_i } }
  end

  def reproduce(line)
    acrobats, bouncoids = line[0..1]
    year = year(line)
    year.times do
      a, b = babies(line)
      da, db = decommission(line)
        acrobats += a
        bouncoids += b
        unless year == 0
          acrobats -= da
          bouncoids -= db
        end
      line[0] = acrobats
      line[1] = bouncoids
    end
    return [acrobats, bouncoids].join(" ")
  end

  def babies(line)
    a, b = line[0..1]
    pairs = ([a, b].min * 0.02).to_i
    p pairs
    alpha, beta = rates(line)
    babies_a = (pairs * alpha).to_i
    babies_b = (pairs * beta).to_i
    remainder = pairs - (babies_a + babies_b)
    rem_a = remainder/2
    rem_b = remainder - rem_a
    return babies_a + rem_a, babies_b + rem_b
  end

  def rates(line)
    alpha = line[2].to_f/100
    beta = line[3].to_f/100
    return alpha, beta
  end

  def year(line)
    line.last.to_i
  end

  def decommission(line)
    a = (line[0] * 0.01).to_i
    b = (line[1] * 0.01).to_i
    return a, b
  end
  def output
    parse.each_with_index.map do |array, i|
      "Case ##{i + 1}: #{ reproduce array }"
    end
  end
end

lines = ARGF.each_line
zathras = Zathras.new lines
puts zathras.output