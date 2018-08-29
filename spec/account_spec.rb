require './lib/account.rb'

describe Account do

    it 'account has an account owner' do
        expect(subject.account_owner).to eq true
    end

    # it 'account has a pin code' do

    # end

    # it 'account is active' do

    # end

    # it 'account expires in the future' do

    # end

end