require './lib/valera'

RSpec.describe Valera do
  describe 'Valera' do
    valera = Valera.new
    context 'check_hp' do
      valera.stats['health'] = 1000
      valera.condition_repairs
      it { expect(valera.check_hp).to eq false }
    end
    context 'check_fun' do
      valera.stats['fun'] = -10
      it { expect(valera.check_fun).to eq true }
    end
    context 'check_mana' do
      valera.stats['mana'] = 100
      it { expect(valera.check_mana).to eq true }
    end
    context 'check_fatigue' do
      valera.stats['fatigue'] = 100
      it { expect(valera.check_fatigue).to eq true }
    end
    context 'check_condition' do
      valera.check_condition
      it { expect(valera.stats['alive']).to eq false }
    end
  end
end
