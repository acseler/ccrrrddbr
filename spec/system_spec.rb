require 'spec_helper'
require 'codebreaker/system'
require 'codebreaker/game_enums'

# Module Codebreaker
module Codebreaker
  RSpec.describe System do
    let(:system) { System.new }
    let(:result_success) do
      h = {}
      h.store(:res_success, GameEnums::WIN)
      h.store(:res_of_match, '++++')
      h.store(:turns, 4)
      h.store(:hint, '3')
      h.store(:date, Time.now)
      h
    end

    context '#hint_checker' do
      it "should print hint '=> 3'" do
        expect { system.hint_checker(result_success) }.to output("=> 3\n").to_stdout
      end
    end
  end
end
