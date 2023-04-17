require "./drink.rb"
require "./cup_coffee.rb"
require "./snack.rb"

# 商品の追加
cider = Drink.new(name: 'cider', price: 100,manufacturer: 'サントリー')
cola = Drink.new(name: 'cola', price: 150, manufacturer: 'コカ・コーラ')
hot_coffee = Coffee.new(name: 'hot coffee', price: 100, manufacturer: 'UCC', type:'hot')
ptato_chips = Snack.new(name: "ポテチ", price: 150, manufacturer: '湖池屋')
#　自販機を作る
vending_machine = VendingMachine.new

# カップの追加
vending_machine.add_cup(110)
vending_machine.add_cup(50)
vending_machine.add_cup(60)
# コインの投入
vending_machine.deposit_coin(100)
# 投入されている金額の確認
puts vending_machine.show_coin
# サイダーを購入
puts vending_machine.press_button(cider)

vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)

puts vending_machine.press_button(cola)
puts vending_machine.press_button(hot_coffee)
puts vending_machine.show_coin

puts vending_machine.show_cup

vending_machine.deposit_coin(100)

puts vending_machine.press_button(ptato_chips)

puts vending_machine.show_coin