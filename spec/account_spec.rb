require './lib/account.rb'

describe Account do

    let(:person) {instance_double('Person', name: 'Thomas')}
    subject { described_class.new({owner: person}) }

    it 'account has an account owner' do
        expect(subject.name).to eq person
    end

    it 'account is active' do
        expect(subject.account_status).to eq :active
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
    
    # it 'account expires in the future' do
    #     expect(subject.exp_date).to eq '04/20'
    # end

    it 'check length of pin_code' do
        pin_code_length = Math.log10(subject.pin_code).to_i + 1
        expect(pin_code_length).to eq 4
    end

end