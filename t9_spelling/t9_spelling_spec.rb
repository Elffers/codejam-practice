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

  context 'parse' do
    it 'returns array of strings' do
      expect(data.parse.first).to eq "hi"
      expect(data.parse.last).to eq "hello world"
    end

    it 'has three entries' do
      expect(data.parse.count).to eq 4
    end
  end

  context 't9' do
    string = "hi"
    xit 'returns t9' do
      expect(data.t9(string)).to eq "44 444"
    end
  end

  context 'output' do
    xit 'formats output' do
      expect(data.output).to eq output.map {|line| line.delete("\n")}
    end
  end


  context 'Keypad' do
    let(:keypad){ T9Speller::Keypad.new }
    context 'keystroke' do
      it "returns keypad entry for letter" do
        expect(keypad.keystroke("b")).to eq "22"
        expect(keypad.keystroke("v")).to eq "888"
        expect(keypad.keystroke(" ")).to eq "0"
      end
    end

    context 'find_letter' do
      it 'finds which key the letter is on' do
        expect(keypad.key_for("a")).to eq "2"
        expect(keypad.key_for("z")).to eq "9"
      end
    end
  end

end