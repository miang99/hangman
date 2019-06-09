require_relative 'player.rb'
require_relative 'display_game.rb'
require_relative 'additional_modules.rb'
class Game
    
    attr_reader :player, :hangman

    include GameInterface
    include Checking

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
        puts "You have to guess this word: #{@player.display_guess_word}"
        puts "The hang man now is like: "
        @hangman.display
        run_game
    end

    private

    def run_game
        loop do
            game_flow
            @hangman.update_hangman(@player.incorrect_point)
            puts "The hangman now is: "
            @hangman.display 
            break if check_final_result()
            break if ask_to_save_game(player)        
        
        end
        
    end

    def game_flow
        answer = ask_for_guess
        checking_word(player: @player, answer: answer)
        show_update_result(@player)
        
    end

    def check_final_result
        if win?(@player.guess_word)
            show_win_result
            return true
        elsif lose?(@player.incorrect_point)
            show_lose_result
            return true
        end
    end
end

Game.introduction