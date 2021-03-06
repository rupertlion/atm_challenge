require './lib/atm.rb'

describe Atm do
    
    let(:account) { instance_double('Account', pin_code: '1234', exp_date: '10/19', account_status: :active) }

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end

    it 'has $1000 on initialize' do
        expect(subject.funds).to eq 1000
    end
    
    it 'funds should be reduced at withdraw' do
        subject.withdraw(50, '1234', account)
        expect(subject.funds).to eq 950
    end

    it 'allow funds to be released only if available in account' do
        expected_output = {status: true, message: 'Success', date: Date.today, amount: 45, bills:[20,20,5]}
        expect(subject.withdraw(45, '1234', account)).to eq expected_output
    end

    it 'rejects withdraw if account has insufficient funds' do
        expected_output = {status: false, message: 'Insufficient funds in account', date: Date.today}
        expect(subject.withdraw(105, '1234', account)).to eq expected_output
    end
    
    it 'rejects withdraw if Atm has insufficient funds'do
        subject.funds = 50
        expected_output = {status: false, message: 'Insufficient funds in ATM', date: Date.today}
        expect(subject.withdraw(100,'1234',account)).to eq expected_output
    end

    it 'rejects transaction if pin is incorrect' do
        expected_output = {status: false, message: 'Pin code incorrect', date: Date.today}
        expect(subject.withdraw(45,'9999',account)).to eq expected_output
    end

    it 'reject withdraw if card has expired' do
        allow(account).to receive(:exp_date).and_return('12/15')
        expected_output = {status: false, message: 'Card has expired', date: Date.today}
        expect(subject.withdraw(6,'1234',account)).to eq expected_output
    end

    it 'reject withdraw if account disabled' do
        allow(account).to receive(:account_status).and_return(:disabled)
        expected_output = {status: false, message: 'Account disabled', date: Date.today}
        expect(subject.withdraw(6, '1234', account)).to eq expected_output
    end  
    
end