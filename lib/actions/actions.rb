require_relative '../valera'
require_relative 'move'

class Actions
  attr_accessor :act

  @act = {
    '1' => lambda { |valera|
      @move_ob.work(valera.stats)
    },
    '2' => lambda { |valera|
             @move_ob.to_contemplate_nature(valera.stats)
           },
    '3' => lambda { |valera|
             @move_ob.relax_at_home(valera.stats)
           },
    '4' => lambda { |valera|
             @move_ob.go_in_bar(valera.stats)
           },
    '5' => lambda { |valera|
             @move_ob.drink_with_marginals(valera.stats)
           },
    '6' => lambda { |valera|
             @move_ob.sing_in_metro(valera.stats)
           },
    '7' => lambda { |valera|
             @move_ob.go_to_sleep(valera.stats)
           },
    '8' => lambda { |valera|
             valera.stats
           }
  }

  def self.move(valera, step)
    @move_ob = Move.new
    @act[step.to_s].call(valera)
  end
end
