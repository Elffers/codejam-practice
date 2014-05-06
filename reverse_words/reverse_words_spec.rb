require_relative 'reverse_words'

describe Reverser do

let(:input){ File.readlines('test.txt') }
let(:output) {
    <<-OUTPUT
Case #1: test a is this
Case #2: foobar
Case #3: base your all
    OUTPUT
  }
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
    it 'returns array of strings' do
      expect(data.parse.first).to eq "this is a test"
    end

    it 'has three entries' do
      expect(data.parse.count).to eq 3
    end
  end
end