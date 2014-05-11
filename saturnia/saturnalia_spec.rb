require_relative 'saturnalia'

describe Saturnalia do
  let(:input){ File.readlines('test_input.txt') }
  let(:output) { File.readlines('test_output.txt') }
  let(:data){ Saturnalia.new input }

  context 'intialize' do
    context 'initialize' do
      it 'sets lines' do
        expect(data.lines.first).to eq "5"
      end
    end

    context 'output' do
      it 'formats output' do
        expect(data.output).to eq output
      end
    end
  end

end