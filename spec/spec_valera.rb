require 'rspec'
require_relative '../lib/valera'

RSpec.describe Valera do
  describe 'Valera' do
    valera = Valera.new
    context 'check_true' do
      valera.stats = {
        'health' => 70,
        'mana' => 10,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(valera.check_condition).to eq true }
    end
  end
end