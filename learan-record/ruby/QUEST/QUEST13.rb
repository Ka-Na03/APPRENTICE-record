# 例外処理のついた電卓プログラムを作成

def calculate(num1, num2, operator)
    case operator
    when '+' 
        num1 + num2
    when '-' 
        num1 - num2
    when '*' 
        num1 * num2
    when '/' 
        num1 / num2
    else
        raise "演算子には +、-、、/ のいずれかを使用してください"
    end
end

begin
print "一番目の整数を入力してください:"
num1 = gets.chomp.to_f

print "二番目の整数を入力してください:"
num2 = gets.chomp.to_f

print "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

result = calculate(num1, num2, operator)
    puts result
rescue ZeroDivisionError
   puts "ゼロによる割り算は許可されていません。"   
# rescue 
#   puts "num1、 num2 には整数を入力してください"   

  #  puts "演算子には +、-、、/ のいずれかを使用してください"

end 

# 割り算の例外が通らず'0/1'をすると'Infinity'になる
# 'to_f'を'to_i'にすると上記の問題は解決するが小数点を入力して足すと整数部分のみ足される?
# 'to_f'のまま割り算の例外が通るようにしたい
# 最初の'def calculate(num1, num2, operator)'の書き方から考えなおす。