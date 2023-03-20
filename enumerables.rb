# calls my_each twice on the array, printing all the numbers twice.


# My Each
# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and 
# returns the original array. Do not use Enumerable's each method. I want to be able to write:

class Array 

    def my_each(&blk)  

        i = 0 

        while i < self.length
            blk.call(self[i])

            i+= 1
        end 

        return self 

    end 





return_value = [1, 2, 3].my_each do |num|
    puts num
end 
   # => 1
      
   
   p return_value  # => [1, 2, 3]

#    My Select
#    Now extend the Array class to include my_select that takes a 
#    block and returns a new array containing only elements that satisfy the block. Use your my_each method!
   
#    Example:

    def my_select(&blk)

        array = []

        self.my_each do |ele| 
            array << ele if blk.call(ele)

        end 

        return array 

    end 
   
   a = [1, 2, 3]
   p a.my_select { |num| num > 1 } # => [2, 3]
    p  a.my_select { |num| num == 4 } # => []


    # my_reject
    # Write my_reject to take a block and return a new array excluding elements
    # that satisfy the block.
    
    def my_reject(&blk)
        array = []
        self.my_each do |ele|
            if !blk.call(ele)
                array << ele
            end
        end
        array
    end

    a = [1, 2, 3]
    p a.my_reject { |num| num > 1 } # => [1]
    p a.my_reject { |num| num == 4 } # => [1, 2, 3]

    # my_any? / my_all?
    # Write my_any? to return true if any elements of the array satisfy the block
    # and my_all? to return true only if all elements satisfy the block.

    def my_any?(&blk)
        self.my_each do |ele|
            return true if blk.call(ele)
        end
        return false
    end

    puts
    puts "my_any?"
    a = [1, 2, 3]
    p a.my_any? { |num| num > 1 } # => true
    p a.my_any? { |num| num == 4 } # => false

    def my_all?(&blk)
        self.my_each do |ele|
            return false if !blk.call(ele)
        end
        return true
    end

    puts
    puts "my_all?"
    p a.my_all? { |num| num > 1 } # => false
    p a.my_all? { |num| num < 4 } # => true

    # my_flatten
    # my_flatten should return all elements of the array into a new, 
    # one-dimensional array. Hint: use recursion!

    def my_flatten
        #Base case: not array

        new_array = []

        return new_array << self  if !self.instance_of?(Array)   #check if self is not an array 
        
        # return self if self.length == 1 && self.instance_of?(Array)   #check if self is an array of length 1

        self.my_each do |ele|

            if ele.instance_of?(Array)                                  #check if ele is an array
                new_array += ele.my_flatten
            else 
                new_array << ele
            end 

            
        end 

    
        return new_array 

    end

    puts
    puts "my_flatten"
    p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
    p [1,[2,3]].my_flatten

    # my_zip
    # Write my_zip to take any number of arguments. It should return a new array
    # containing self.length elements. Each element of the new array should be an 
    # array with a length of the input arguments + 1 and contain the merged elements at that index. 
    # If the size of any argument is less than self, nil is returned for that location

    def my_zip(*arrays)
        new_array = []
        (self.length).times do |i|
            arr = [self[i]]
            arrays.each do |array|
                arr << array[i]
            end
            new_array << arr
        end
        new_array
    end

    puts
    puts "my_zip"
    a = [ 4, 5, 6 ]
    b = [ 7, 8, 9 ]
    p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    
    p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    c = [10, 11, 12]
    d = [13, 14, 15]
    p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# My Rotate
# Write a method my_rotate that returns a new array containing 
# all the elements of the original array in a rotated order.
#  By default, the array should rotate by one element. 
# If a negative value is given, the array is rotated in the opposite direction.

# Example:

def my_rotate(num = 1)
    
    new_array = []

    i = 0 

    while i < self.length 

        new_array << self[(i + num) % self.length] 

        i+= 1 
    end 


    new_array

end 




p a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]  
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# My Join
# my_join returns a single string containing all the elements of the array,
#  separated by the given string separator. If no separator is given, an empty string is used.

# Example:

def my_join(seperator = "")

    new_str = ""

    self.my_each do |ele|
        new_str += ele + seperator
    end 

    
    if seperator != ""
        new_str[0...-1] 
    else  
        new_str 
    end 


end 

p a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"









end 