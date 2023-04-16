class VendingMachine  
    attr_accessor :total_coins
    
    def initialize
        @total_coins = 0
    end

    def deposit_coin(coin)
        
        if coin == 100
            @total_coins ||= 0
            @total_coins += coin
        else
            puts "100円玉以外のコインは使用できません。"
        end
    end

    def show_coin
        puts @total_coins
    end
    
    def press_button(item)
        if @total_coins >= 100
            @total_coins -= item.price
            return item.name
        else
            puts "コインが足りません。"
        end
    end
end