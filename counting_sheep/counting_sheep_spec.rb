require_relative 'counting_sheep'

describe Counter do

  let(:input){ File.readlines('test.txt') }

  let(:output) { File.readlines('output.txt') }
  let(:counter) { Counter.new(input) }

  context "#initialize" do
    it "sets lines" do
      expect(counter.lines.first).to eq 0
      expect(counter.lines[1]).to eq 1
    end
  end

  context "#parse" do
    it "returns counter prices" do
      expect(counter.parse).to eq ["INSOMNIA", 10, 90, 110, 5076]
    end
  end

  context "#count_sheep" do
    it "returns insomnia if 0" do
      expect(counter.count_sheep 0).to eq("INSOMNIA")
    end

    it "returns correct num" do
      expect(counter.count_sheep 1).to eq(10)
      expect(counter.count_sheep 2).to eq(90)
      expect(counter.count_sheep 11).to eq(110)
    end
  end

  context "#output" do
    it "prints each case" do
      expect(counter.output).to eq output.map { |line| line.chomp}
    end
  end
end
