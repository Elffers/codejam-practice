require_relative 'storecredit'

describe StoreCredit do

  let(:input) { File.readlines('test.txt') }

  let(:output) {
    <<-OUTPUT
Case #1: 2 3
Case #2: 1 4
Case #3: 4 5
    OUTPUT
  }

let(:data){ StoreCredit.new input }

let(:bad_input){ ["1"] }

  context 'initialize' do
    it "lines should be an array" do
      expect(data.lines).to be_an_instance_of Array
    end
  end
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
      kase2 = [200, [150, 24, 79, 50, 88, 345, 3]]
      kase3 = [8, [2, 1, 9, 4, 4, 56, 90, 3]]
      kase4 = [8, [1, 9, 4, 2, 56, 90, 3, 6]]

      expect(data.find_items kase.first, kase.last).to eq [2, 3]
      expect(data.find_items kase2.first, kase2.last).to eq [1, 4]
      expect(data.find_items kase3.first, kase3.last).to eq [4, 5]
      expect(data.find_items kase4.first, kase4.last).to eq [4, 8]
    end
  end

  context 'find_all_index' do
    it "returns the index + 1 of all elements in array" do
      array = [2, 1, 9, 4, 4, 56, 90, 3]
      value = 4

      expect(data.find_all_index(value, array)).to eq [4, 5]
    end
  end

  context 'prices' do
    let(:string){ "150 24 79 50 88 345 3" }

    it 'returns an array' do
      expect(data.prices(string)).to be_an_instance_of Array
      expect(data.prices(string).count).to eq 7
    end

    it 'contains integers' do
      expect(data.prices(string).first).to be_an_instance_of Fixnum
    end
  end

  context 'bad input' do
    it 'raises error if passed bad input' do
      bad_data = StoreCredit.new bad_input
      expect{ bad_data.parse }.to raise_error StoreCredit::InputError
    end
  end
end