require './lib/account.rb'
require './lib/atm.rb'
require 'date'

class Person
    attr_accessor :name, :cash, :account
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil
    end

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(money)
        @account == nil ? missing_account : deposit_funds(money)
    end

    def withdraw(user_entry = {})
        @account == nil ? missing_account : withdraw_funds(user_entry)
    end

end

private

def set_name(obj)
    obj == nil ?  missing_name : @name = obj
end

def missing_name
    raise ArgumentError, "A name is required"
end

def missing_account
    raise RuntimeError, "No account present"
end

def missing_atm
    raise RuntimeError, "An ATM is required"
end

def deposit_funds(money)
    @account.balance += money
    @cash -= money
end

def withdraw_funds(user_entry)
    user_entry[:atm] == nil ? missing_atm : atm = user_entry[:atm]
    account = @account
    amount = user_entry[:amount]
    pin = user_entry[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
end

def increase_cash(response)
    @cash += response[:amount]
end

