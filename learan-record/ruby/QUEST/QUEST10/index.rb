require "./drink.rb"
require "./cup_coffee.rb"

cider = Drink.new(name: 'cider', price: 100,manufacturer: 'サントリー')
cola = Drink.new(name: 'cola', price: 150, manufacturer: 'コカ・コーラ')

hot_coffee = Coffee.new(name: 'hot coffee', price: 100, manufacturer: 'Boss')

vending_machine = VendingMachine.new

vending_machine.deposit_coin(100)

puts vending_machine.show_coin

puts vending_machine.press_button(cider)

vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.show_coin

puts vending_machine.press_button(hot_coffee)
puts vending_machine.press_button(cola)

puts vending_machine.press_manufacturer_name
