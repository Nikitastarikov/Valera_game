require './lib/menu/save_or_load_the_game/loader'
require './lib/valera'

RSpec.describe Loader do
  describe 'Loader' do

    let(:loader) do
      loader = Loader.new('testsave')
    end

    let(:valera_stats) do
      valera = Valera.new
      valera = loader.load
      valera.stats
    end

    let(:stats) do
      {
        'health' => 100,
        'mana' => 0,
        'fun' => 10,
        'fatigue' => 0,
        'money' => 10,
        'alive' => true
      }
    end

    let(:valid) do
      loader.valid?
    end
    
    context 'check_valid_path' do
      it { expect(valid).to eq true }
    end
    context 'check_loader' do
      
      
      it { expect(valera_stats).to eq stats }
    end
  end
end
