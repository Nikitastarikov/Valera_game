require './lib/menu/save_or_load_the_game/loader'
require './lib/valera'

RSpec.describe Loader do
  describe 'Loader' do
    valera = Valera.new
    loader = Loader.new('testsave')
    context 'check_valid_path' do
      it { expect(loader.valid?).to eq true }
    end
    context 'check_loader' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 10,
        'fatigue' => 0,
        'money' => 10,
        'alive' => true
      }
      valera = loader.load
      it { expect(valera.stats).to eq stats }
    end
  end
end
