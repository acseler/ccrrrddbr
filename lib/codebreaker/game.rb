$LOAD_PATH << File.dirname(__FILE__)
require 'game_enums'

module Codebreaker
  # Class Game
  class Game
    include GameEnums
    TUNS_DEFAULT = 12
    attr_reader :turns, :hint_count

    def initialize
      @secret_code = ''
      @turns = TUNS_DEFAULT
      @hint_count = 1
    end

    def start
      @secret_code << (1..4).map { rand(1..6) }.join
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

      secret_copy, code_chars = secret_copy.zip(code_chars).delete_if do |item|
        code_match << '+' if item.uniq.size == 1
      end.flatten.partition.with_index { |_item, index| index.even? }

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
