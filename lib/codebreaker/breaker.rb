$LOAD_PATH << File.dirname(__FILE__)
require 'message_checker'
require 'message_helper'

module Codebreaker
  # Class Breaker
  class Breaker
    include MessageChecker
    include MessageHelper
    def try
      try_to_guess_code
      until check_guess_message((input = STDIN.gets.chomp))
        try_to_guess_code
      end
      input
    end
  end
end
