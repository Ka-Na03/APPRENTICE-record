# each
# 配列またはハッシュ.each { |要素| 処理 }
# 配列やハッシュに対して各要素を順番に処理する
# 変数に配列を代入しなくても出力時に([ , ])などと指定して出力できる
# with_index インデックス番号を入れれる

def print_names(names)
    names.each_with_index do |name,index|
        puts "#{index + 1}.#{name}"
    end
end

print_names(["かいと","まいちゃん"])

# map
# .mapメソッド構文　配列またはハッシュ.map { |要素| 変換処理 }
# ブロック内の変換処理を適用して結果を新しい配列やハッシュのオブジェクトにして返す

def square(numbers)
    squared_numbers = numbers.map {|num| num * num}
    return squared_numbers
end
squared_numbers = square([2,4,5])

print squared_numbers

# select
#.selectメソッド構文　配列またはハッシュ.select { |要素| 条件式 }
# 配列やハッシュの要素に対してブロックがtrueを返す要素だけ新しい配列として返す
# 条件に合致する要素のみを抽出できるので配列やハッシュの要素をフィルタリングできる

def select_even_numbers(numbers)
    even_numbers = numbers.select{|num| num.even?}
    return even_numbers
end
even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print even_numbers
