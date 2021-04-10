# When done, submit this entire file to the autograder.
# Name: Nathaniel Leake, UIN: 424003778


# Part 1

def sum arr
  total = 0
  for i in arr
    total += i
  end
  return total
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    large1 = arr[0]
    large2 = arr[1]
    if large2 > large1
      temp = large1
      large1 = large2
      large2 = temp
    end
    arr[2..arr.length].each do |elem|
      if elem > large1
        large2 = large1
        large1 = elem
      elsif elem > large2
        large2 = elem
      end
    end
    return large1 + large2
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  arr.each_with_index do |x, i|
    arr[(i+1)..arr.length].each_with_index do |y, j|
      if x + y == n && i != j
        return true
      end
    end
  end
  return false
end


# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  return s =~ /\A(?=[^aeiouAEIOU])(?=[a-zA-Z])/i
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  return s =~ /\A(?=^[01]*00$)|(?=^0$)/i
end


# Part 3

class BookInStock
  # YOUR CODE HERE
  attr_reader :isbn, :price
  
  def isbn= (isbn)
    # Note: Does not check ISBN number properly,
    # only checks to make sure it is non-empty
    if isbn == ''
      raise ArgumentError.new("Must provide an ISBN number")
    else
      @isbn = isbn
    end
  end

  def price= (price)
    price = price.to_f
    if price <= 0
      raise ArgumentError.new("Price must positive non-zero")
    else
      @price = price
    end
  end
  
  def initialize(isbn, price)
    if(isbn == '' || price <= 0)
      raise ArgumentError.new("Bad args")
    end
    @isbn= isbn
    @price= price
  end

  def price_as_string
    return sprintf "$%1.2f", @price
  end
end
