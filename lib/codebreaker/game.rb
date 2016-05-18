$LOAD_PATH << File.dirname(__FILE__)
require 'game_enums'

module Codebreaker
  # Class Game
  class Game
    include GameEnums
    TUNS_DEFAULT = 12
    attr_reader :turns, :hint_count, :hint, :game_success

    def initialize
      @secret_code = ''
      @turns = TUNS_DEFAULT
      @hint_count = 1
    end

    def start
      4.times { @secret_code << rand(1..6).to_s }
    end

    def game_over?(code)
      return hash_out(CONTINUE, nil, hint_answer) if code == 'hint'
      res_of_match = match_code(code)
      hash_out(if success(res_of_match)
                 WIN
               else
                 @turns == 0 ? LOSE : CONTINUE
               end, res_of_match)
    end

    private

    def match_code(code)
      @turns -= 1
      check_code(code)
    end

    def check_code(code)
      secret_copy = @secret_code.chars
      code_chars = code.chars
      code_match = ''
      code_chars.map!.with_index do |item, index|
        if item == secret_copy[index]
          code_match << '+'
          secret_copy[index] = nil
          nil
        else
          item
        end
      end.compact!
      secret_copy.compact!
      code_chars.each do |item|
        if secret_copy.include?(item)
          code_match << '-'
          secret_copy.delete(item)
        end
      end
      code_match
    end

    def success(code_equality)
      @success = code_equality == '++++'
    end

    def hash_out(res_success, res_of_match, hint = nil)
      {
        res_success: res_success,
        res_of_match: res_of_match,
        turns: @turns,
        hint: hint
      }
    end

    def get_hint(position)
      @hint_count -= 1
      @secret_code[position]
    end

    def hint_answer
      if @hint_count == 0
        'You have taken all hints.'
      else
        get_hint(rand(0..3))
      end
    end
  end
end
