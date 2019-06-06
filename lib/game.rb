require_relative 'player.rb'
require_relative 'display_game.rb'
require_relative 'additional_modules.rb'
class Game
    
    attr_reader :player, :hangman

    #set up the game
    def self.introduction
        puts 'Welcome to hangman'
        self.asking_save_game         
    end

    def self.asking_save_game
        p 'Do you wanna open the saved game?(Y/N) '
        ans = gets.chomp.downcase
        if ans == 'y' 
            print 'Write player\'s name: '
            name = gets.chomp
            self.check_saved_game(name)
        elsif ans == 'n'
            self.create_new_game
        else 
            puts 'you write the wrong option!'
        end  
    end

    def self.check_saved_game(name)
        begin 
            player = Player.load_game name 
            self.new player        
        rescue 
            puts "There is no such file named #{name}"
            puts "Let's create a new play!"
            self.create_new_game
        end
    end

    def self.create_new_game
        print 'Please enter your name: '
        name = gets.chomp
         
        self.new(Player.new name)
    end

    def initialize(player)
        @player = player
        @hangman = HangmanDisplay.new @player.incorrect_point
        p self
    end  
    
    def checking_result

    end

    def show_result

    end
end

Game.introduction