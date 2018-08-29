require 'date'

class Account

    STANDARD_VALIDITY_YRS = 5

    attr_accessor :pin_code, :exp_date, :account_status, :name
   
    def initialize(attrs = {})
        @name = set_owner(attrs[:owner])
        @pin_code = rand(1000..9999)
        @exp_date = set_expire_date
        @account_status = :active
    end

    def deactivate
        @account_status = :deactivated
    end

    private

    def set_owner(obj)
        obj == nil ?  missing_owner : @owner = obj
    end

    def missing_owner
         raise "An Account owner is required"
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

end