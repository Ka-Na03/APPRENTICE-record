require "./vendingmachine.rb"
require "./drink.rb"

class Coffee < Drink

    def initialize(name:, price:, manufacturer:)
        super(name: name, price: price, manufacturer: manufacturer)
    end
   


end
