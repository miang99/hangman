class HangmanDisplay

    attr_accessor :incorrect_guess

    HANGMAN = ["+----+".rjust(20),
               "|    |".rjust(20),
               "     |".rjust(20),
              "      |".rjust(20),
              "      |".rjust(20),
              "       |".rjust(20),
              "=========".rjust(25),
    ]    

    def initialize(incorrect_guess = 0)
        @incorrect_guess = incorrect_guess
        puts @incorrect_guess
        puts reload_hangman(HANGMAN)
    end

    def display
        update_hangman(@incorrect_guess, HANGMAN)
        puts HANGMAN
    end
     
    private

    def reload_hangman(hangman)
        if @incorrect_guess >0
            for i in 1..@incorrect_guess do
                update_hangman(i, hangman)
            end 
        end
        hangman
    end    

    def update_hangman(incorrect_guess, hangman)
        case incorrect_guess
        when 1 then hangman[2] ="o    |".rjust(20)
        when 2 then hangman[3] ="|    |".rjust(20)
        when 3 then hangman[3] ="/|    |".rjust(20)
        when 4 then hangman[3] ="/|\\   |".rjust(20)
        when 5 then hangman[4] ="/     |".rjust(20)
        when 6 then hangman[4] ="/ \\   |".rjust(20)
        end                
    end
end

hang_man = HangmanDisplay.new 3
hang_man.incorrect_guess = 4
hang_man.display