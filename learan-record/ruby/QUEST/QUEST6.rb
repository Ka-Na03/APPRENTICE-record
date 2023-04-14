# QUEST 6

# 挨拶
def hello(num)
    num.times do |i|
        puts "こんにちは！"
    end
end

puts hello(5)

# これだと最後に指定した回数の数字も出力されてしまう。

def hello(num)
    num.times do |i|
        if
            i < num - 1
            puts "こんにちは！"
        end
    end
end

puts hello(5)

# 試行錯誤したが、一旦保留。

# 羊

def sheep(n)
    n.times do |i|
        puts "羊が#{i + 1}匹"
    end
end

puts sheep(3)

#同様に最後に繰り返しの回数が出力される...

# 総和 1

# def sum_1_100
#    numbers = [1..100]
#    sum = 0
#    numbers.each do |num|
#        sum += num
#    end
#end

#puts sum_1_100

#上記のコードだとエラーが出てChatGPTにエラー内容を聞き、以下修正。

def sum_1_100
    numbers = (1..100).to_a
    sum = 0
    numbers.each do |num|
        sum += num
    end
    sum
end

puts sum_1_100

#ChatGPTで範囲オブジェクトやハッシュオブジェクトを配列に変換する".to_a"メソッドを発見

#総和 2

def sum(x,y)
    total = (x..y).to_a
    sum = 0
    total.each do |num|
        sum += num
    end
    sum
end

puts sum(10,80)

# フィボナッチ数列

def fibonacci(n)
    maid = [0, 1]
    (2..n).each do |days|
        maid[days] = maid[days - 1] + maid[days - 2]
    end
    maid.each do |salary|
    end
end

puts fibonacci(5)
