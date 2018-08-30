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

    def withdraw(withdrawals = {})
        @account == nil ? missing_account : withdraw_funds(withdrawals)
    end

end

private

def set_name(obj)
    obj == nil ?  missing_name : @name = obj
end

def missing_name
    raise "A name is required"
end

def missing_account
    raise "No account present"
end

def deposit_funds(money)
    @account.balance += money
    @cash -= money
end

def withdraw_funds(withdrawals)
    withdrawals[:atm] == nil ? missing_atm : atm = withdrawals[:atm]
    account = @account
    amount = withdrawals[:amount]
    pin = withdrawals[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
end

def increase_cash(response)
    @cash += response[:amount]
end

def missing_atm
    raise "An ATM is required"
end