class VendingMachine  
    attr_accessor :total_coins, :total_cups
    
    def initialize
        @total_coins = 0
        @total_cups = 0
    end

    def deposit_coin(coin)
        
        if coin == 100
            @total_coins ||= 0
            @total_coins += coin
            puts "１００円追加しました、現在#{@total_coins}円です。"
        else
            puts "100円玉以外のコインは使用できません。"
        end
    end

    def show_coin
        puts "投入金額：#{@total_coins}円"
    end
    
    def press_button(item)
        if @total_coins >= item.price && item.need_cup?
            @total_cups -= 1
            @total_coins -= item.price
            return puts "購入した商品：#{item.name},#{item.price}円"
        elsif
            @total_coins >= item.price
            @total_coins -= item.price
            return puts "購入した商品：#{item.name},#{item.price}円"
        else
            puts "#{item.name}を購入するコインが足りません。"
        end
    end
    def add_cup(cups)
        if @total_cups + cups <= 100
            @total_cups += cups
            puts "現在のカップ数は#{@total_cups}個です。"
        else
            puts "最大１００個までしか追加できません。カップを入れなおしてください。"
        end
    end

    def show_cup
        puts "現在のカップの数は#{@total_cups}個です"
    end

end