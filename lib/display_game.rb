class HangmanDisplay

    HANGMAN = ["+----+".rjust(10),
               "|    |".rjust(10),
               "     |".rjust(10),
              "      |".rjust(10),
              "      |".rjust(10),
              "       |".rjust(10),
              "=========".rjust(12),
    ]    

    def initialize(incorrect_guess)
        reload_hangman(HANGMAN, incorrect_guess)
    end

    def display
        puts HANGMAN
    end

    def update_hangman(incorrect_guess)
        updating(incorrect_guess, HANGMAN)
    end

    private

    def updating(incorrect_guess, hangman)
        case incorrect_guess
        when 1 then hangman[2] ="o    |".rjust(10)
        when 2 then hangman[3] ="|    |".rjust(10)
        when 3 then hangman[3] ="/|    |".rjust(10)
        when 4 then hangman[3] ="/|\\   |".rjust(10)
        when 5 then hangman[4] ="/     |".rjust(10)
        when 6 then hangman[4] ="/ \\   |".rjust(10)
        end                
    end
     

    def reload_hangman(hangman, incorrect_guess)
        if incorrect_guess >0
            for i in 1..incorrect_guess do
                updating(i, hangman)
            end 
        end
        hangman
    end    
end
