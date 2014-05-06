require_relative 'reverse_words'

describe Reverser do

let(:input){ File.readlines('test.txt') }
let(:output) { File.readlines('reverse_output_test.txt') }
let!(:data){ Reverser.new input }

  context 'initialize' do
    it "lines should be an array" do
      expect(data.lines).to be_an_instance_of Array
    end

    it 'lines should have four entries' do
      expect(data.lines.count).to eq 4
    end
  end

  context 'parse' do
    it 'returns array of arrays' do
      expect(data.parse.first).to eq %w[this is a test]
      expect(data.parse.last).to eq %w[all your base]
    end

    it 'has three entries' do
      expect(data.parse.count).to eq 3
    end
  end

  context 'reverse' do
    it 'returns word if sentence is one word long' do
      arg = ["foobar"]
      expect(data.reverse(arg)).to eq "foobar"
    end

    it 'reverses the words in a sentence' do
      arg = %w[this is a test]
      expect(data.reverse(arg)).to eq "test a is this"
    end
  end

  context 'output' do
    it 'formats output' do
      expect(data.output.first).to eq "Case #1: test a is this"
    end
  end

end