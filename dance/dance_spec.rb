require_relative 'dance'

describe Dance do

  let(:input){ File.readlines('test.txt') }

  let(:output) { File.readlines('output.txt') }
  let(:dance) { Dance.new(input) }

  context "#initialize" do
    it "sets lines" do
      expect(dance.lines.first).to eq "8 3 1"
      expect(dance.lines.count).to eq 3
    end
  end

  context "#parse" do
    it "returns left and right dance partners" do
      expect(dance.parse.first).to eq "6 4"
      expect(dance.parse[1]).to eq "1 7"
      expect(dance.parse[2]).to eq "2 4"
    end
  end

  context "#find_partners" do
    it "returns left and right dance partners" do
      line = "8 3 1"
      expect(dance.find_partners line).to eq "6 4"
    end

    it "returns left and right dance partners with wrap around" do
      line = "8 7 1"
      expect(dance.find_partners line).to eq "2 8"
      line = "8 2 1"
      expect(dance.find_partners line).to eq "1 7"
    end
  end

  context "#dance" do
    it "returns new arrangement of dancers" do
      expected1 = {1=>1, 2=>0, 3=>3, 4=>2, 5=>5, 6=>4, 7=>7, 8=>6}
      expected2 = {1=>2, 2=>7, 3=>4, 4=>1, 5=>6, 6=>3, 7=>0, 8=>5}
      # [2, 1, 4, 3, 6, 5, 8, 7]
      expect(dance.dance(8, 1)).to eq expected1
      # [7, 4, 1, 6, 3, 8, 5, 2]
      expect(dance.dance(8, 2)).to eq expected2
    end
  end

  context "#output" do
    it "prints each case" do
      expect(dance.output).to eq output.map { |line| line.chomp}
    end
  end
end
