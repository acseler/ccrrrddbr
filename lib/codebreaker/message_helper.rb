$LOAD_PATH << File.dirname(__FILE__)
require 'message_checker'

module Codebreaker
  # Module MessageHelper
  module MessageHelper
    include MessageChecker

    def congratulation
      puts 'Congratulations! You win!'
    end

    def lose
      puts 'You lose!'
    end

    def want_to_save?
      yes_no('Want to save progress?(y/n)')
    end

    def play_again?
      yes_no('Want play again?(y/n)')
    end

    def yes_no(question)
      puts question
      input = STDIN.gets.chomp
      check_yes_no(input) ? (return input == 'y') : yes_no(question)
    end

    def try_to_guess_code
      puts "Try to guess the secret code (type 'hint' for hint) : "
    end

    def hint(h)
      puts "=> #{h}"
    end

    def wrong_and_turns(turns)
      puts "Wrong! You have only #{turns} turns"
    end

    def code_match(m)
      puts "match : [#{m}]"
    end
  end
end
