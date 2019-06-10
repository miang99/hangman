require_relative 'player.rb'

module GameInterface

    def ask_for_guess
        puts "What character do you think the secret word contains? "
        answer = gets.chomp       
    end    

    def show_update_result(player)
        puts "Your guess word now is: #{@player.display_guess_word}"
        puts "Your correct point: #{player.correct_point}"
        puts "Your incorrect_point: #{player.incorrect_point}"
        puts "You have #{6 - player.incorrect_point.to_i} lefts to answer incorrectly."
    end

    def ask_to_save_game(player)
        print 'Do you want to exit and save the game?(Y/N) '
        ans = gets.chomp
        if ans == 'y'
            player.save_game
            return true
        end
    end

    def show_win_result
        puts 'Congratulation! You win.'
    end

    def show_lose_result
        puts "You lose. Let\'s restart and play the game."
    end
end



module Checking

    #checking word
    def checking_word(player: , answer:)
        if player.secret_word.include?(answer) && !(player.guess_word.include?(answer))
            update_correct(player, answer)            
        else
            update_incorrect(player)
        end                    
    end

    def update_correct(player, answer)
        guess_word = player.guess_word
        secret_word = player.secret_word.split('')
        secret_word.each_with_index do |value, index|
            guess_word[index] = answer if value == answer
        end
        player.correct_point += 1
    end

    def update_incorrect(player)
        player.incorrect_point +=1        
    end

    #checking final result
    def win?(guess_word)
        !(guess_word.include?('_'))                        
    end

    def lose?(incorrect_point)
        incorrect_point == 6
    end    
end
