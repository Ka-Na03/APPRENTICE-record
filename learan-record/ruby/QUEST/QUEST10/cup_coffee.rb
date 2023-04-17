require "./vendingmachine.rb"
require "./drink.rb"

class Coffee < Drink
    def initialize(name:, price:, manufacturer:, type:)
        super(name: name, price: price, manufacturer: manufacturer)
        @type = type
    end

   def need_cup?
    true
   end


end