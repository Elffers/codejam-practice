require_relative 'zathras'

  describe Zathras do
    let(:input){ File.readlines('zathra_test_input.txt') }
    let(:output) { File.readlines('zathra_test_output.txt') }
    let(:data){ Zathras.new input }
    let(:line1) { [12345, 12890, 10, 13, 0] }
    let(:line2) { [12345, 12890, 10, 13, 1] }
    let(:line3) { [12345, 12890, 10, 13, 100] }
    let(:line4) { [12345, 12890, 10, 13, 5049] }



    context 'parse' do
      it 'returns array of integers' do
        expect(data.parse.first).to eq [12345, 12890, 10, 13, 0]
      end
    end
    context 'reproduce' do
      it 'returns array containing baby acrobots and bouncoids' do
        expect(data.reproduce(line1)).to eq [12345, 12890].join(" ")
        expect(data.reproduce(line2)).to eq [12341, 12889].join(" ")
        expect(data.reproduce(line3)).to eq [11993, 12676].join(" ")
        expect(data.reproduce(line4)).to eq [3099, 3199].join(" ")
      end
    end

    context 'babies' do
      it 'returns array containing a and b babies' do
        # 24, 31, 95, 96
        expect(data.babies(line1)).to eq [24 + 95, 31 + 96]
        expect(data.babies(line1).reduce(:+)).to eq 246
      end
    end
    context 'decommission' do
      it 'returns array containing decommission numbers for a and b' do
        expect(data.decommission(line1)).to eq [123, 128]
      end
    end
    context 'rates' do
      it 'returns array containing rates a and b' do
        expect(data.rates(line1)).to eq [0.1, 0.13]
      end
    end
    context 'year' do
      it 'returns the year' do
        expect(data.year(line1)).to eq 0
        expect(data.year(line2)).to eq 1
      end
    end

    context 'output' do
      it 'formats output' do
        expect(data.output).to eq output.map {|line| line.delete("\n")}
      end
    end

  end