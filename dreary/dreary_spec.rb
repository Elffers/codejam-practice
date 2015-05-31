require_relative 'dreary'

describe Dreary do
  let(:input) { StringIO.new("4\n1 1\n1 0\n0 0\n255 0").readlines }
  let(:output) { <<output.lines
Case #1: 8
Case #2: 2
Case #3: 1
Case #4: 256
output
  }

  let(:dreary) { Dreary.new input }
  describe "#initialize" do
    it "sets lines" do
      expect(dreary.lines.first).to eq "4"
      expect(dreary.lines.count).to eq input.count
    end
  end

  describe "#combinations" do
    describe "if v is 0" do
      it "returns the correct number of combinations" do
        line = "1 0"
        expect(dreary.combinations line).to eq 2

        line = "0 0"
        expect(dreary.combinations line).to eq 1

        line = "2 0"
        expect(dreary.combinations line).to eq 3

        line = "255 0"
        expect(dreary.combinations line).to eq 256
      end
    end

    describe "if k and v are the same" do
      it "returns the correct number of combinations" do
        line = "1 1"
        expect(dreary.combinations line).to eq 8

        line = "2 2"
        expect(dreary.combinations line).to eq 27

        line = "3 3"
        expect(dreary.combinations line).to eq 64
      end
    end

    describe "if k and v are different" do
      # if v = 1, combations will be k times the number of combos of 2
      # elements minus k-1

      it "returns the correct number of combinations" do
        line = "1 1"
        expect(dreary.combinations line).to eq 8

        line = "2 1"
        # 2 * 8 - (2-1)
        expect(dreary.combinations line).to eq 15

        line = "3 1"
        # 3 * 8 - (3-1)
        expect(dreary.combinations line).to eq 22
      end
    end
  end

  describe "#output" do
    it "prints each case" do
      expect(dreary.output).to eq output.map { |line| line.delete("\n") }
    end
  end
end
