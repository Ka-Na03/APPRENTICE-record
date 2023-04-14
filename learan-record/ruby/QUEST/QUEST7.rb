# each

def print_names(names)
    names.each_with_index do |name,index|
        puts "#{index + 1}.#{name}"
    end
end

print_names(["かいと","まいちゃん"])

# map

def square(numbers)
    squared_numbers = numbers.map {|num| num * num}
    return squared_numbers
end
squared_numbers = square([2,4,5])

print squared_numbers

# select

def select_even_numbers(numbers)
    even_numbers = numbers.select{|num| num.even?}
    return even_numbers
end
even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print even_numbers
