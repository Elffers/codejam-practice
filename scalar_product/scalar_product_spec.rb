require_relative 'scalar_product'

describe ScalarProduct do

  let(:input){ File.readlines('test_input.txt') }
  let(:output) { File.readlines('test_output.txt') }
  let!(:data){ ScalarProduct.new input }

  context 'intitialize' do
    it 'lines is an array' do
      expect(data.lines.first).to eq "2"
      expect(data.lines.last).to eq "1 0 1 0 1"
    end
  end

end