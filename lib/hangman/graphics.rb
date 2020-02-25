module Hangman
  module Graphics
    DEAD = <<HANG
    _______
   |/      |
   |      (_)
   |      \\|/
   |       |
   |      / \\
   |
  _|___
HANG

    ALIVE = <<WIN

  (•_•)
  <)  )╯
  /   \\
WIN

     ALIVE2 = <<WIN2
  \(•_•)
  (  (>
  /   \\

WIN2

     ALIVE3 = <<WIN3
  (•_•)
  <)  )>
  /   \\
WIN3

    OBFUSCATION_CHAR = "👾"

    def self.clear_screen
      # The ` ` allow you to run bash commands from inside your ruby code!
      # clear itself is just a bash command… go ahead and try running it in
      # your terminal!
      puts `clear`
    end

    def self.obfuscate_word word, guessed
      obfuscated = ''

      word.chars do |char|
        if guessed.include? char
          obfuscated << " #{char} "
        else
          obfuscated << " #{OBFUSCATION_CHAR}  "
        end
      end

      obfuscated
    end

    def self.give_up
      puts "Goodbye cruel world!"
      sleep 0.5
    end
  end
end
