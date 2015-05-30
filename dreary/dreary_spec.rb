require_relative 'dreary'

describe Dreary do
  let(:input) { StringIO.new("4\n1 1\n1 0\n0 0").readlines }
  let(:output) { <<output.lines
Case #1: 8
Case #2: 2
Case #3: 1
output
}
# Case #4: 256

  let(:dreary) { Dreary.new input }
  describe "#initialize" do
    it "sets lines" do
      expect(dreary.lines.first).to eq "4"
      expect(dreary.lines.count).to eq 4
    end
  end

  describe "#combinations" do
    it "finds the number of combintations given k and v" do
      line = "1 1"
      expect(dreary.combinations line).to eq 8
      line = "1 0"
      expect(dreary.combinations line).to eq 2
      line = "0 0"
      expect(dreary.combinations line).to eq 1
      line = "255 0"
      # expect(dreary.combinations line).to eq 256
    end
  end

  describe "#output" do
    it "prints each case" do
      expect(dreary.output).to eq output.map {|line| line.delete("\n")}
    end
  end
end
