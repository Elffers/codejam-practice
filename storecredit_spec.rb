require_relative 'storecredit'

describe StoreCredit do

  let(:input) {
    <<-INPUT
3
100
3
5 75 25
200
7
150 24 79 50 88 345 3
8
8
2 1 9 4 4 56 90 3
    INPUT
  }

  context "parse" do
    it "has three entries" do
      data = StoreCredit.new input

      expect(data.parse.length).to eq 3
    end

    it "parses store credit and items" do
      data = StoreCredit.new input

      expect(data.parse.first).to eq [100, [5, 75, 25]]
    end
  end
end