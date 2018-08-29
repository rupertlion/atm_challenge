require './lib/account.rb'

describe Account do

    let(:person) {instance_double('Person', name: 'Thomas')}
    subject { described_class.new({owner: person}) }

    # it 'account has an account owner' do
    #     expect(subject.account_owner).to eq person
    # end

    it 'account has a pin code' do
        expect(subject.pin_code).to eq '1234'
    end

    # it 'account is active' do
    #     expect(subject.account_status).to eq :active
    # end

    # it 'account expires in the future' do
    #     expect(subject.exp_date).to eq '04/20'
    # end

end