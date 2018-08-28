require './lib/atm.rb'

describe Atm do
    
    let(:account) { instance_double('Account') }

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end

    it 'has $1000 on initialize' do
        expect(subject.funds).to eq 1000
    end
    
    it 'funds should be reduced at withdraw' do
        subject.withdraw(50, account)
        expect(subject.funds).to eq 950
    end

    it 'allow funds to be released only if available in account' do
        expected_output = {status: true, message: 'Success', date: Date.today, amount: 45}
        expect(subject.withdraw(45, account)).to eq expected_output
    end

end