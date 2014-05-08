require_relative 'milkshake'

describe Milkshake do
  let(:input){ File.readlines('test_input.txt') }
  let(:output) { File.readlines('test_output.txt') }
  let(:data){ Milkshake.new input }

  context 'initialize' do
    it 'sets lines' do
      expect(data.lines.first).to eq "2"
    end
  end

  context 'parse' do
    it 'returns array of kase objects' do
      first, second = data.parse

      expect(first).to be_an_instance_of Milkshake::Kase

      expect(first.flavors).to_not eq second.flavors
    end
  end

  context 'output' do
    it 'formats output properly' do
      expect(data.output).to eq output.map { |line| line.chomp}
    end
  end

  describe Milkshake::Kase do
    let(:customer_info){ ["1 1 1", "2 1 0 2 0", "1 5 0"] }
    let(:case_input){ ["5", "3", *customer_info] }
    let(:kase){ Milkshake::Kase.new case_input}
    let(:impossible_input) { ["1", "2", "1 1 0", "1 1 1"]}
    let(:impossible_kase){ Milkshake::Kase.new impossible_input}

    context 'initialize' do
      it 'sets flavors' do
        expect(kase.flavors).to eq 5
      end

      it 'sets customer count' do
        expect(kase.customer_count).to eq 3
      end

      it 'sets customers as array of arrays' do
        expect(kase.customers.first).to be_an_instance_of Array
      end
    end

    context 'set_customers' do
      it 'returns an array of arrays' do
        customers = kase.set_customers(customer_info)

        expect(customers).to be_an_instance_of Array
        expect(customers.first).to be_an_instance_of Array
      end
    end

    context 'mix' do
      it 'returns a solution' do
        solution = kase.mix

        expect(solution).to eq "1 0 0 0 0"
      end

      it 'returns all the malts' do
        input = ["2", "2", "1 1 1", "1 2 1"]
        kase = Milkshake::Kase.new input

        solution = kase.mix

        expect(solution).to eq "1 1"
      end

      it 'returns IMPOSSIBLE if no solution is found' do
        solution = impossible_kase.mix

        expect(solution).to eq "IMPOSSIBLE"
      end

      it 'returns solution if two people have exactly the same preference' do
        input = ["2", "2", "1 1 1", "1 1 1"]
        kase = Milkshake::Kase.new input

        solution = kase.mix

        expect(solution).to eq "1 0"
      end

      it 'minimizes malts' do
        input = ["2", "2", "2 1 1 2 0", "2 1 0 2 1"]
        kase = Milkshake::Kase.new input

        solution = kase.mix

        expect(solution).to eq "0 0"
      end

    end
  end


end