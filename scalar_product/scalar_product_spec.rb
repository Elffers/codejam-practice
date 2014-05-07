require_relative 'scalar_product'

describe ScalarProduct do

  let(:input){ File.readlines('test_input.txt') }
  let(:output) { File.readlines('test_output.txt') }
  let!(:data){ ScalarProduct.new input }

  context 'intitialize' do
    it 'removes first line' do
      expect(data.lines.first).to eq "3"
    end

    it 'lines is an array' do
      expect(data.lines.last).to eq "1 0 1 0 1"
    end
  end

  context 'parse' do
    it 'maps two vectors into array' do
      expect(data.parse.first).to eq ["1 3 -5", "-2 4 1"]
      expect(data.parse.last).to eq ["1 2 3 4 5", "1 0 1 0 1"]
    end
  end

end