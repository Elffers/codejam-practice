require_relative 't9_spelling'

describe T9Speller do

let(:input){ File.readlines('test_input.txt') }
let(:output) { File.readlines('test_output.txt') }
let!(:data){ T9Speller.new input }

context 'initialize' do
  it 'lines should be an array' do
    expect(data.lines.first).to eq "4"
    expect(data.lines.last).to eq "hello world"

  end

  it 'should have 5 lines' do
    expect(data.lines.count).to eq 5
  end
end

end