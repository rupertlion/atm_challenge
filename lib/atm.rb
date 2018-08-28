require 'date'

class Atm
    attr_accessor :funds
    def initialize
        @funds = 1000
    end
   
    def withdraw (amount,account)
        case
        when insufficient_funds_in_account?(amount, account)
            {status: false, message: 'Insufficient funds in account', date: Date.today}
        when insufficient_funds_in_Atm?(amount, account)
            {status: false, message: 'Insufficient funds in ATM', date: Date.today}
        else
            perform_transaction(amount, account)   
        end
    end 
    
    private

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance
    end

    def perform_transaction(amount, account)   
        @funds -= amount
        account.balance = account.balance - amount
        {status: true, message: 'Success', date: Date.today, amount: amount}
    end 

    def insufficient_funds_in_Atm?(amount, account)
        @funds < amount
    end  
end