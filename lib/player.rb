require "yaml"

class Player

    attr_accessor :correct_point, :incorrect_point, :guess_word
    attr_reader :name

    def initialize(name)
        @name = name
        @correct_point = 0
        @incorrect_point = 0
        @secret_word = select_secret_word
        @guess_word = generate_guess_word(@secret_word)
    end

    def display_guess_word
        @guess_word.join(" ")        
    end

    def save_game
        player = YAML.dump(self)
        p self
        p player
        Dir.mkdir("saved_game") unless Dir.exist?("saved_game")
        file_name ||= "saved_game/#{self.name}.txt"
        File.open(file_name, "w"){ |file| file.puts player}        
    end    

    def self.load_game(name)
        file_name = "saved_game/#{name.downcase}.txt"
        json = File.open(file_name, "r"){ |file| file.read }
        player = YAML.load(json)
    end
    
    private

    def generate_guess_word(secret_word)
        word = secret_word.split("")
        for i in (0..word.length-1) do
            next if [2,5,8,11].include?(i)
            word[i] = "_"
        end
        word       
    end

    def select_secret_word
        dictionary = generate_secret_word
        index = rand(0..dictionary.length)
        dictionary[index].downcase
    end

    def generate_secret_word
        dictionary = File.open("5text.txt", "r"){ |text| text.read}
        dictionary.split("\n").select{ |word| (5..12) === word.length}
        
    end
end
