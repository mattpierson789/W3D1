class Game
    
    attr_reader :dictionary

    def initialize(players, fragment)
        @players = players
        @fragment = fragment
        @dictionary = {}

        File.open("dictionary.txt").each_line do |line|
            key, value = line.strip.split("=")
            @dictionary[key] = value
        end
    end
end

g = Game.new(1,2)
p word = g.dictionary.keys.sample

