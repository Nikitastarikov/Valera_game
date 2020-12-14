require './lib/actions/actions'
require './lib/valera'

RSpec.describe Actions do
  describe 'Actions' do
    context 'check_actions_1' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '1')
      it { expect(stats['fun']).to eq 0 }
    end
    context 'check_actions_2' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '2')
      it { expect(stats['fun']).to eq 6 }
    end
    context 'check_actions_3' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '3')
      it { expect(stats['fun']).to eq 4 }
    end
    context 'check_actions_4' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 100,
        'alive' => true
      }
      stats = Actions.move(stats, '4')
      it { expect(stats['fun']).to eq 6 }
    end
    context 'check_actions_5' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 150,
        'alive' => true
      }
      stats = Actions.move(stats, '5')
      it { expect(stats['fun']).to eq 10 }
    end
    context 'check_actions_6' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 50,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '6')
      it { expect(stats['fun']).to eq 6 }
    end
    context 'check_actions_7' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 80,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '7')
      it { expect(stats['fun']).to eq 2 }
    end
    context 'check_actions_8' do
      stats = {
        'health' => 100,
        'fun' => 5,
        'mana' => 0,
        'fatigue' => 0,
        'money' => 20,
        'alive' => true
      }
      stats = Actions.move(stats, '8')
      it { expect(stats['fun']).to eq 5 }
    end
  end
end
