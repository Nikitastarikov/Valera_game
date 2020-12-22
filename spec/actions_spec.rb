require './lib/actions/actions'
require './lib/valera'

RSpec.describe Actions do
  let(:stats) do
    {
      'health' => 100,
      'fun' => 5,
      'mana' => 0,
      'fatigue' => 0,
      'money' => 20,
      'alive' => true
    }
  end

  let(:stats_start_1) do
    stats_loc = stats
    stats_loc = Actions.move(stats_loc, '1')
    stats_loc['fun']
  end

  let(:stats_start_2) do
    stats_loc = stats
    stats_loc = Actions.move(stats_loc, '2')
    stats_loc['fun']
  end

  let(:stats_start_3) do
    stats_loc = stats
    stats_loc = Actions.move(stats_loc, '3')
    stats_loc['fun']
  end

  let(:stats_start_4) do
    stats_loc = stats
    stats_loc['money'] = 100
    stats_loc = Actions.move(stats_loc, '4')
    stats_loc['fun']
  end

  let(:stats_start_5) do
    stats_loc = stats
    stats_loc['money'] = 150
    stats_loc = Actions.move(stats_loc, '5')
    stats_loc['fun']
  end

  let(:stats_start_6) do
    stats_loc = stats
    stats_loc['mana'] = 50
    stats_loc = Actions.move(stats_loc, '6')
    stats_loc['fun']
  end

  let(:stats_start_7) do
    stats_loc = stats
    stats_loc['mana'] = 80
    stats_loc = Actions.move(stats_loc, '7')
    stats_loc['fun']
  end

  let(:stats_start_8) do
    stats_loc = stats
    stats_loc = Actions.move(stats_loc, '8')
    stats_loc['fun']
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
