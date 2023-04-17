require "./vendingmachine.rb"

class Drink < VendingMachine
    attr_accessor :name, :price, :manufacturer

    def initialize(name:, price:, manufacturer:)
        @name = name
        @price = price
        @manufacturer = manufacturer
    end
    def press_manufacturer_name
        @manufacturer
    end
    private :press_manufacturer_name

    def need_cup?
        false
    end

end
