require 'spec_helper'
require 'message_helper'

# Module Codebreaker
module Codebreaker
  RSpec.describe MessageHelper do
    let(:helper) { Class.new { extend MessageHelper } }
    let(:cong_mess) { "Congratulations! You win!\n" }
    let(:lose_mess) { "You lose!\n" }
    let(:try_mess) { "Try to guess the secret code (type 'hint' for hint) : \n" }
    let(:quest) { "Question?\n" }
    let(:save_mess) { "Want to save progress?(y/n)\n" }
    let(:play_mess) { "Want play again?(y/n)\n" }
    let(:hint) { "=> 3\n" }
    let(:wrong) { "Wrong! You have only 3 turns\n" }
    let(:code_match) { "match : [++++]\n" }

    context '#congratulation' do
      it "should print 'Congratulations! You win!\n'" do
        expect { helper.congratulation }.to output(cong_mess).to_stdout
      end
    end

    context '#lose' do
      it "should print 'You lose!\n'" do
        expect { helper.lose }.to output(lose_mess).to_stdout
      end
    end

    context '#try_to_guess_code' do
      it "print Try to guess the secret code (type 'hint' for hint) : \n" do
        expect { helper.try_to_guess_code }.to output(try_mess).to_stdout
      end
    end

    context '#yes_no' do
      it "should print 'Question?\n'" do
        allow(STDIN).to receive(:gets).and_return('y')
        expect { helper.yes_no(quest) }.to output(quest).to_stdout
      end
    end

    context '#want_to_save?' do
      it "should print 'Want to save progress?(y/n)\n'" do
        allow(STDIN).to receive(:gets).and_return('y')
        expect { helper.want_to_save? }.to output(save_mess).to_stdout
      end

      it 'should return false on n and true on y' do
        allow(STDIN).to receive(:gets).and_return('n')
        expect(helper.want_to_save?).to be_falsey
        allow(STDIN).to receive(:gets).and_return('y')
        expect(helper.want_to_save?).to be_truthy
      end
    end

    context '#play_again?' do
      it "should print 'Want play again?(y/n)\n'" do
        allow(STDIN).to receive(:gets).and_return('y')
        expect { helper.play_again? }.to output(play_mess).to_stdout
      end

      it 'should return false on n and true on y' do
        allow(STDIN).to receive(:gets).and_return('n')
        expect(helper.play_again?).to be_falsey
        allow(STDIN).to receive(:gets).and_return('y')
        expect(helper.play_again?).to be_truthy
      end
    end

    context '#hint' do
      it "should return => 3\n" do
        expect { helper.hint(3) }.to output(hint).to_stdout
      end
    end

    context '#wrong_and_turns' do
      it "should return 'Wrong! You have only 3 turns\n'" do
        expect { helper.wrong_and_turns(3) }.to output(wrong).to_stdout
      end
    end

    context '#code_match' do
      it "should return match : [++++]\n" do
        expect { helper.code_match('++++') }.to output(code_match).to_stdout
      end
    end
  end
end
