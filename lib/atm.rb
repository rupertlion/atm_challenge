require 'date'

class Atm
    attr_accessor :funds
    def initialize
        @funds = 1000
    end
   
    def withdraw (amount, pin_code, account)
        case
        when insufficient_funds_in_account?(amount, account)
            {status: false, message: 'Insufficient funds in account', date: Date.today}
        when insufficient_funds_in_Atm?(amount, account)
            {status: false, message: 'Insufficient funds in ATM', date: Date.today}
        when pin_code_incorrect?(pin_code, account.pin_code)
            {status: false, message: 'Pin code incorrect', date: Date.today}
        when card_expired?(account.exp_date)   
            {status: false, message: 'Card has expired', date: Date.today} 
        when account_disabled?(account.account_status)
            {status: false, message: 'Account disabled', date: Date.today}
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
        {status: true, message: 'Success', date: Date.today, amount: amount, bills: add_bills(amount)}
    end 

    def add_bills(amount)
        denominations = [20,10,5]
        bills = []
        denominations.each do |bill|
            while amount - bill >= 0
                amount -= bill 
                bills << bill
            end
        end
        bills
    end

    def insufficient_funds_in_Atm?(amount, account)
        @funds < amount
    end  

    def pin_code_incorrect?(pin_code, actual_pin)
        pin_code != actual_pin
    end

    def card_expired?(exp_date)
        Date.strptime(exp_date, '%m/%y') < Date.today
    end  

    def account_disabled?(account_status)
        account_status != :active
    end
    

end