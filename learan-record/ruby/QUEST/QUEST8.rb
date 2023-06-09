# ハッシュ
# ハッシュと配列の違いについて何が違うのか、それぞれの用途

# 配列は複数の値を並べて管理するのに対して、ハッシュはそれぞれの値にキーと呼ばれる名前をつけて管理します。
# ハッシュと配列の用途の違いはキーと値を紐づけて管理する必要があるかないかだと思います
# また、ハッシュを配列の[ , ]で囲むことで複数のハッシュを一つの配列で管理することもできます
# 簡単にわかる様に学校に例えると、配列は一つのクラスでクラスの中には色々な人がいます、
# そのクラス内の個人の名前と特技など、様々な個人情報をひとまとめにするのがハッシュです。

# 首都

# シンボルを使ってやろうとしたが日本語や特殊文字が入ると文字列にする方が一般的らしい
def print_capitals(capitals)
    capitals.each do |country, capital|
        puts "#{country}の首都は#{capital}です"
    end
end

print_capitals({"日本" => "東京", "アメリカ" => "ワシントンD.C"})
