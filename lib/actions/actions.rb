require_relative '../valera'
require_relative 'move'

class Actions
  attr_accessor :act

  @act = {
    '1' => lambda { |stats|
      @move_ob.work(stats)
    },
    '2' => lambda { |stats|
             @move_ob.to_contemplate_nature(stats)
           },
    '3' => lambda { |stats|
             @move_ob.relax_at_home(stats)
           },
    '4' => lambda { |stats|
             @move_ob.go_in_bar(stats)
           },
    '5' => lambda { |stats|
             @move_ob.drink_with_marginals(stats)
           },
    '6' => lambda { |stats|
             @move_ob.sing_in_metro(stats)
           },
    '7' => lambda { |stats|
             @move_ob.go_to_sleep(stats)
           },
    '8' => lambda { |stats|
             stats
           }
  }

  def self.move(stats, step)
    @move_ob = Move.new
    @act[step.to_s].call(stats)
  end
end
