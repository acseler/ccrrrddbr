require 'spec_helper'
require 'codebreaker/breaker'

# Module Codebreaker
module Codebreaker
  RSpec.describe Breaker do
    subject(:breaker) { Breaker.new }
    let(:input_val) { '1234' }
    context '#try' do
      it 'should return 1234' do
        allow(STDIN).to receive(:gets).and_return(input_val)
        expect(breaker.try).to eq input_val
      end
    end
  end
end
