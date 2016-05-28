$LOAD_PATH << File.dirname(__FILE__)
require 'game_enums'
require 'message_helper'
require 'file_helper'

module Codebreaker
  # Class System
  class System
    include GameEnums
    include MessageHelper
    include FileHelper

    def play_game
      @game = Game.new
      @breaker = Breaker.new
      @game.start
      while (res_suc = @game.game_over?(@breaker.try))[:res_success] == CONTINUE
        hint_checker(res_suc)
        next
      end
      win_checker(res_suc[:res_success])
      save_score(res_suc) if want_to_save?
      play_game if play_again?
    end

    def hint_checker(result_of_success)
      if result_of_success[:hint]
        hint(result_of_success[:hint])
      else
        wrong_and_turns(result_of_success[:turns])
        code_match(result_of_success[:res_of_match])
      end
    end

    def win_checker(success)
      case success
      when WIN
        congratulation
      when LOSE
        lose
      end
    end
  end
end
