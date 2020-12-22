require './lib/valera'

RSpec.describe Valera do
  describe 'Valera' do
    let(:valera) do
      Valera.new
    end

    let(:valera_check_hp) do
      valera.stats['health'] = 1000
      valera.condition_repairs!
      valera.check_hp?
    end

    let(:valera_check_fun) do
      valera.stats['fun'] = -10
      valera.check_fun?
    end

    let(:valera_check_mana) do
      valera.stats['mana'] = 100
      valera.check_mana?
    end

    let(:valera_check_fatigue) do
      valera.stats['fatigue'] = 100
      valera.check_fatigue?
    end

    let(:valera_check_alive) do
      valera.stats['alive']
    end

    context 'check_hp' do
      it { expect(valera_check_hp).to eq false }
    end
    context 'check_fun' do
      it { expect(valera_check_fun).to eq true }
    end
    context 'check_mana' do
      it { expect(valera_check_mana).to eq true }
    end
    context 'check_fatigue' do
      it { expect(valera_check_fatigue).to eq true }
    end
    context 'check_condition' do
      it { expect(valera_check_alive).to eq true }
    end
  end
end
