class Fish 

    def initalize(name, lost)
        @name = name
        @lost = lost
    end

    def name 
        @name 
    end

    def name=(new_name)
        @name = name
    end

    def self.random_state
        [true,false].sample
    end 

    def self_make_nemo
        state_of_being = Fish.random_state
        Fish.new("Nemo", state_of_being)
    end

    def self.random_state_of_being
        [true,false].sample
    end 


    def self_make_fish

        state_of_being = Fish.random_state_of_being
        name = ''
        5.times do 
            name += ('a'..'z').to_a.sample
        end 
        Fish.new(name, state_of_being)


    end 

end 