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











end 