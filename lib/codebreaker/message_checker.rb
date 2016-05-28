module Codebreaker
  # Module MessageChecker
  module MessageChecker
    def check_guess_message(message)
      case message
      when 'hint' then true
      when /^[1-6]{4}$/ then true
      else false
      end
    end

    def check_yes_no(message)
      !message.match(/^[y]$|^[n]$/).nil?
    end
  end
end
