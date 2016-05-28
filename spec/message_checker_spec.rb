require 'spec_helper'
require 'codebreaker/message_checker'

# Module Codebreaker
module Codebreaker
  RSpec.describe do
    let(:extended_class) { Class.new { extend MessageChecker } }

    context '#check_guess_message' do
      it "should return true on 'hint'" do
        expect(extended_class.check_guess_message('hint')).to be_truthy
      end

      it "should return true on '2222'" do
        expect(extended_class.check_guess_message('2222')).to be_truthy
      end

      it 'should return false on 3 ,5 or more digits' do
        expect(extended_class.check_guess_message('333')).to be_falsey
        expect(extended_class.check_guess_message('55555')).to be_falsey
        expect(extended_class.check_guess_message('3')).to be_falsey
        expect(extended_class.check_guess_message('777777777')).to be_falsey
      end

      it 'should return false on wrong input' do
        expect(extended_class.check_guess_message('adh as f as')).to be_falsey
      end

      it "should return false on 'hint 5'" do
        expect(extended_class.check_guess_message('hint 5')).to be_falsey
      end
    end

    context '#check_yes_no' do
      it "should return true on 'y' or 'n'" do
        expect(extended_class.check_yes_no('y')).to be_truthy
        expect(extended_class.check_yes_no('n')).to be_truthy
      end

      it "should return false on whatever except 'y' or 'n'" do
        expect(extended_class.check_yes_no('af')).to be_falsey
        expect(extended_class.check_yes_no('a')).to be_falsey
        expect(extended_class.check_yes_no('123asdasd')).to be_falsey
      end
    end
  end
end
