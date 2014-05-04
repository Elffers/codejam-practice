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

  context "output" do
    it "returns a result for each case" do
      number_of_cases = data.parse.length

      expect(data.output.length).to eq number_of_cases
    end

    it "formats output message for each case" do
      expect(data.output.first).to eq "Case #1: 2 3"
      expect(data.output.last).to eq "Case #3: 4 5"
    end
  end

  context "find_items" do
    it 'returns index of items whose sum is the price' do
      kase = [100, [5, 75, 25]]
      kase2 = [8, [2, 1, 9, 4, 4, 56, 90, 3]]
      kase3 = [200, [150, 24, 79, 50, 88, 345, 3]]

      expect(data.find_items kase.first, kase.last).to eq [2, 3]
      expect(data.find_items kase2.first, kase2.last).to eq [4, 5]
      expect(data.find_items kase3.first, kase3.last).to eq [1, 4]
    end
  end

  context 'find_all_index' do
    it "returns the index + 1 of all elements in array" do
      array = [2, 1, 9, 4, 4, 56, 90, 3]
      value = 4

      expect(data.find_all_index(value, array)).to eq [4, 5]
    end
  end
end