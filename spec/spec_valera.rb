require './lib/valera'

RSpec.describe Valera do
  describe 'Valera' do
    valera = Valera.new
    context 'check_true' do
      valera.stats['health'] = 0
      it { expect(valera.check_hp).to eq true }
    end
  end
end
