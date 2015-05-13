require_relative 'io_error'
require 'stringio'

describe IOError do
  let(:input) { StringIO.new("2\n2\nOIOOIIIIOIOOIOII\n21\nOIOOIOOIOOIOOOOOOOIOOIIIOOIIIIOOOOIIOOIIOOIOOIIIOOIOOOOOOOIOOOIOOIOOOOIIOOIIOOOOOIIOOIOOOOIIOOIIOOIOOOOOOIOOIOIOOOIIOIOOOIIOIIOIOOIOOOIOOOIOOOOIOOIOOOOOOOIIIOIOOOIOIOOI").readlines }

  let(:output) { StringIO.new("Case #1: OK\nCase #2: I '<3' \"C0d3 J4m\"! :)").readlines }
  let(:io) { IOError.new(input) }

  context "#initialize" do
    it "sets lines" do
      expect(io.lines.first).to eq "2"
      expect(io.lines.count).to eq 5
    end
  end

  context "#parse" do
    it "returns an enumerator of pairs of strings" do
      expect(io.parse.first).to eq ["01001111", "01001011"]
    end
  end

  context "#translate" do
    it "returns array of ASCII codes" do
      expect(io.translate(["01001111", "01001011"])).to eq "OK"
    end
  end

  context "#output" do
    it "prints each case" do
      expect(io.output).to eq output.map {|line| line.delete("\n")}
    end
  end
end
