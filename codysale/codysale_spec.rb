require_relative 'codysale'

describe Sale do

  let(:input){ File.readlines('test.txt') }

  let(:output) { File.readlines('output.txt') }
  let(:sale) { Sale.new(input) }

  context "#initialize" do
    it "sets lines" do
      expect(sale.lines.first).to eq "3"
      expect(sale.lines[1]).to eq "15 20 60 75 80 100"
    end
  end

  context "#parse" do
    it "returns sale prices" do
      expect(sale.parse.first).to eq "15 60 75"
    end
  end

  context "#find_sale_prices" do
    it "finds sales" do
      expect(sale.find_sale_prices(3, "15 20 60 75 80 100")).to eq("15 60 75")
    end
  end

  context "#output" do
    it "prints each case" do
      expect(sale.output).to eq output.map { |line| line.chomp}
    end
  end
end
