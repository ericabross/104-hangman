module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @word = Dictionary.random
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')

      while true
        print "[#{chances - wrong_tries} chances left]: "

        Signal.trap( "SIGINT") { 
          Graphics.clear_screen
          Graphics.give_up
          exit
        }
        
        ARGV.clear  

        char = gets.chomp
        Graphics.clear_screen

        if word.include? char
          if guess.include? char
            
            if char == ""
              puts 'Enter a letter to play!' + Graphics.obfuscate_word(word, guess)
              placeholder = Graphics.obfuscate_word(word, guess)
            else
              puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
              puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
            end
            
            else
              guess << char
              placeholder = Graphics.obfuscate_word(word, guess)
              puts 'Whoop Whoop!! ' + placeholder
          end
          
          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            puts Graphics::ALIVE
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE2
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE3
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE2
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE3
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE2
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE3
            sleep 0.5
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end
        else
          if guess.include? char
            puts "Oops! You already tried that letter. Try a new letter instead."
            @wrong_tries = @wrong_tries
          elsif !char.match(/^[[:alpha:]]$/) == true
              puts "Only letters may be used."
              @wrong_tries = @wrong_tries
          else
            puts "OH NOES! The word doesn't contain '#{char}'"
            @wrong_tries = @wrong_tries + 1
            guess << char 
          end

          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          else
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end