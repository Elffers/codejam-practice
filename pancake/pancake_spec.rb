require_relative 'pancake'

describe Flipper do

  let(:input){ File.readlines('test.txt') }

  let(:output) { File.readlines('output.txt') }
  let(:flipper) { Flipper.new(input) }

  context "#initialize" do
    it "sets lines" do
      expect(flipper.lines.first).to eq "-"
    end
  end

  context "#parse" do
    xit "returns flipper prices" do
      expect(flipper.parse).to eq ["INSOMNIA", 10, 90, 110, 5076]
    end
  end

  context "#count_flips" do
    it "returns 0 if all happy side up" do
      expect(flipper.count_flips "++".chars).to eq(0)
    end

    it "works" do
      expect(flipper.count_flips "-+".chars).to eq(1)
      expect(flipper.count_flips "+-".chars).to eq(2)
    end

    it "returns correct flips" do
      expect(flipper.count_flips "+-").to eq(1)
    end
  end

  context "flip" do
    it "flips pancakes" do
      expect(flipper.flip("-+".chars).join).to eq("+-")
      expect(flipper.flip("--".chars).join).to eq("++")
    end
  end

  context "#output" do
    xit "prints each case" do
      expect(flipper.output).to eq output.map { |line| line.chomp}
    end
  end
end
