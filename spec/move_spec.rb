require './lib/actions/move'

RSpec.describe Move do
  describe 'Move' do
    move = Move.new
    context 'check_work' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 20
      }
      stats = move.work(stats)
      it { expect(stats['fun']).to eq 0 }
    end
    context 'check_contemplate_nature' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 20
      }
      stats = move.to_contemplate_nature(stats)
      it { expect(stats['fatigue']).to eq 10 }
    end
    context 'check_relax_at_home' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      stats = move.relax_at_home(stats)
      it { expect(stats['mana']).to eq 30 }
    end
    context 'check_go_in_bar' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      stats = move.go_in_bar(stats)
      it { expect(stats['mana']).to eq 60 }
    end
    context 'check_drink_with_marginals' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 150
      }
      stats = move.drink_with_marginals(stats)
      it { expect(stats['health']).to eq 20 }
    end
    context 'check_sing_in_metro' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 20
      }
      stats = move.sing_in_metro(stats)
      it { expect(stats['fun']).to eq 6 }
    end
    context 'check_go_to_sleep' do
      stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => 5,
        'fatigue' => 0,
        'money' => 20
      }
      stats = move.go_to_sleep(stats)
      it { expect(stats['health']).to eq 190 }
    end
  end
end
