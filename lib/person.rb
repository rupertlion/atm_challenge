require './lib/account.rb'
require 'date'

class Person
    attr_accessor :name, :cash, :account
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil
    end

    def create_account
        @account = Account.new({owner: self})
    end
end

private

def set_name(obj)
    obj == nil ?  missing_name : @name = obj
end

def missing_name
     raise "A name is required"
end