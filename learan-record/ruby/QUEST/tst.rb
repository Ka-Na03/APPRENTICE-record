begin

a = 1.to_f / 0.to_f

puts a
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません。"
end
