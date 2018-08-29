class Account

    attr_accessor :pin_code, :exp_date, :account_status, :name
   
    def initialize(attrs = {})
        @name = set_owner(attrs[:owner])
        @pin_code = rand(1000..9999)
        @exp_date = '04/20'
        @account_status = :active
    end

     private

    def set_owner(obj)
        obj == nil ?  missing_owner : @owner = obj
    end

      def missing_owner
         raise "An Account owner is required"
     end
end