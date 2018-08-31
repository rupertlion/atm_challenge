# ATM Challenge

Create an ATM, person and bank account.

### Prerequisites

Installed gemfiles including RSPEC and PRY for testing.

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The web framework used
* [RSPEC](http://rspec.info/) - Testing framework

## Example irb/PRY commands

Initialize an instance of Person class with an owner, "Rupert"
``` 
person = Person.new(name: "Rupert")
=> #<Person:0x00007f87c0b34aa8 @account=nil, @cash=0, @name="Rupert"> 
```
Create an account
```
account = person.create_account
=> #<Account:0x00007f87c0ad3d70
 @account_status=:active,
 @balance=0,
 @exp_date="08/23",
 @name=
  #<Person:0x00007f87c0b34aa8
   @account=#<Account:0x00007f87c0ad3d70 ...>,
   @cash=0,
   @name="Rupert">,
 @owner=
  #<Person:0x00007f87c0b34aa8
   @account=#<Account:0x00007f87c0ad3d70 ...>,
   @cash=0,
   @name="Rupert">,
 @pin_code=5379>
```
 Instaniate an ATM with funds of $1000
```
 atm = Atm.new
=> #<Atm:0x00007f87c08d7170 @funds=1000>
```
Deposit funds and check account balance
```
person.deposit(750)
=> -750

account.balance
=> 750
```
Withdraw funds (utlising pin code generated on account creation), check account balance, check ATM funds
```
person.withdraw(amount: 350, pin: 5379, atm: atm)
=> -400

account.balance
=> 400

atm.funds
=> 650
```

## Authors

* **Rupert Lion, Shirmen Chen**