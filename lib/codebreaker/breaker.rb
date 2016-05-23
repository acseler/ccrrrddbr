$LOAD_PATH << File.dirname(__FILE__)
require 'message_checker'
require 'message_helper'

module Codebreaker
  # Class Breaker
  class Breaker
    include MessageChecker
    include MessageHelper
    def try
      begin
        try_to_guess_code
      end until check_guess_message((input = STDIN.gets.chomp))
      input
    end
  end
end
