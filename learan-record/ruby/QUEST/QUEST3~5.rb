# TEST
puts "Hello, world!"
puts 1 + 2

# QUEST 3
def hello
    puts "Hello World"
end

hello

def greeting(name)
    puts "おはよう、#{name}!"
end

greeting("渡辺")
greeting("いわせ")

# QUEST 4
def area(x, y)
    puts x * y / 2
end

area(5,4)

# QUEST 5
def greater(x,y)
    if x < y
        puts "x < y"
    elsif x > y
        puts "x > y"
    elsif x == y
        puts "x == y"
    end
end

greater(10,5)
greater(-10,-10)

def train_fare(age)
    if age >= 12
        return 200
    elsif age >= 6
        return 100 
    else
    return 0
    end
end

puts train_fare(6)
puts train_fare(5)
puts train_fare(12)

def xor(x,y)
    if x != y
        return true
    else
        return false
    end
end

puts xor(true,true)
puts xor(true,false)
puts xor(false, true)
puts xor(false, false)

# QUEST 6