# 例外処理のついた電卓プログラムを作成

def calculate(num1, num2, operator)
    case operator
        when '+'
            num1.to_i + num2.to_i
        when '-' 
            num1.to_i - num2.to_i
        when '*' 
            num1.to_i * num2.to_i
        when '/' 
            num1.to_i / num2.to_i
    else
        raise RuntimeError
    end        
end

begin
print "一番目の整数を入力してください:"
num1 = gets.chomp.to_f
    if num1.to_i != num1
        raise ArgumentError
    end
#     if num1.is_a?(String) == num1
#         raise ArgumentError
#     end
# != は等しくないよっていうやつ
# num1で入力した数字が5.0の場合Integerで小数点以下を切り捨てられた5(.0)と等しい
# num1で5.2の場合
# != が等しくないってことはif が真になるので、raiseに渡る

#   if num1 % 1 != 0
#        raise ArgumentError    
#    end
print "二番目の整数を入力してください:"
num2 = gets.chomp.to_f
    if num2.to_i != num2
        raise ArgumentError
    end
    # if num2.is_a?(String) == num2
    #     raise ArgumentError
    # end
#   if num2 % 1 != 0
#        raise ArgumentError
#   end

print "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

result = calculate(num1, num2, operator)
puts result
rescue ZeroDivisionError
    puts "ゼロによる割り算は許可されていません。"
rescue RuntimeError
    puts "演算子には +, -, *, / のいずれかを使用してください"
 rescue ArgumentError 
     puts "num1、num2には整数を入力してください"
end 