require 'yaml'

module Codebreaker
  # Module FileHelper
  module FileHelper
    def save_score(score)
      score.delete_if { |k, _v| k == :hint }
      File.open('codebreaker.score', 'a') { |file| file.write(score.to_yaml) }
    end
  end
end
