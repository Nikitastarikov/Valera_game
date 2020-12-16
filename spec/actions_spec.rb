require './lib/actions/actions'
require './lib/valera'

RSpec.describe Actions do

  let(:stats_start_1) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '1')
    stats['fun']
  end

  let(:stats_start_2) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '2')
    stats['fun']
  end

  let(:stats_start_3) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '3')
    stats['fun']
  end

  let(:stats_start_4) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 100,
      'alive' => true
    }
    stats = Actions.move(stats, '4')
    stats['fun']
  end

  let(:stats_start_5) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 150,
      'alive' => true
    }
    stats = Actions.move(stats, '5')
    stats['fun']
  end

  let(:stats_start_6) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 50,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '6')
    stats['fun']
  end

  let(:stats_start_7) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 80,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '7')
    stats['fun']
  end

  let(:stats_start_8) do
    stats = {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
    stats = Actions.move(stats, '8')
    stats['fun']
  end

  describe 'Actions' do
    context 'check_actions_1' do
      it { expect(stats_start_1).to eq 0 }
    end
    context 'check_actions_2' do
      it { expect(stats_start_2).to eq 6 }
    end
    context 'check_actions_3' do
      it { expect(stats_start_3).to eq 4 }
    end
    context 'check_actions_4' do
      it { expect(stats_start_4).to eq 6 }
    end
    context 'check_actions_5' do
      it { expect(stats_start_5).to eq 10 }
    end
    context 'check_actions_6' do
      it { expect(stats_start_6).to eq 6 }
    end
    context 'check_actions_7' do
      it { expect(stats_start_7).to eq 2 }
    end
    context 'check_actions_8' do
      it { expect(stats_start_8).to eq 5 }
    end
  end
end
