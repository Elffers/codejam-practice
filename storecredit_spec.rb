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
  let(:output) {
    <<-OUTPUT
Case #1: 2 3
Case #2: 1 4
Case #3: 4 5
    OUTPUT
  }
let(:data){ StoreCredit.new input }

  context "parse" do
    it "has three entries" do
      expect(data.parse.length).to eq 3
    end

    it "parses store credit and items" do
      expect(data.parse.first).to eq [100, [5, 75, 25]]
      expect(data.parse.last).to eq [8, [2, 1, 9, 4, 4, 56, 90, 3]]
    end
  end

  context "find_items" do
    it "returns result for each case" do
      number_of_cases = data.parse.length
      expect(data.find_items.length).to eq number_of_cases
    end

    it "prints output of each case" do
      expect(data.find_items.first).to eq "Case #1: 2 3"
    end
  end
end