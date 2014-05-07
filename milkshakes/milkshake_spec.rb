require_relative 'milkshake'

describe Milkshake do
  let(:input){ File.readlines('test_input.txt') }
  let(:output) { File.readlines('test_output.txt') }
  let(:data){ Milkshake.new input }

  context 'initialize' do
    it 'sets lines' do
      expect(data.lines.first).to eq "5"
    end
    it 'sets cases' do
      expect(data.cases).to eq "2"
    end
  end

  context 'parse' do
    xit 'returns array of kase objects' do
      expect(data.parse.first).to be_an_instance_of Milkshake::Kase
    end
  end

  describe Milkshake::Kase do
    let(:case_input){ ["5", "3", "1 1 1", "2 1 0 2 0", "1 5 0"] }
    let(:kase){ Milkshake::Kase.new case_input}

    context 'initialize' do
      it 'sets flavors' do
        expect(kase.flavors).to eq "5"
      end

      it 'sets customer count' do
        expect(kase.customer_count).to eq "3"
      end

      it 'sets customers as array of hashes' do
        expect(kase.customers.first).to be_an_instance_of Hash
      end
    end

    context 'set_customers' do
      it 'returns an array of hashes' do
        expect(kase.set_customers(case_input)).to be_an_instance_of Array
        expect(kase.set_customers(case_input).first).to be_an_instance_of Hash
      end

    end
   end


end