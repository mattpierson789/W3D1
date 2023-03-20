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
        return 
    end

    puts
    puts "my_flatten"
    p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]




end 