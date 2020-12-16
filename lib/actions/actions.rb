require_relative '../valera'
require_relative 'move'

class Actions
  attr_accessor :act

  @act = {
    '1' => lambda do |stats|
             @move_ob.work!(stats)
           end,
    '2' => lambda do |stats|
             @move_ob.to_contemplate_nature!(stats)
           end,
    '3' => lambda do |stats|
             @move_ob.relax_at_home!(stats)
           end,
    '4' => lambda do |stats|
             @move_ob.go_in_bar!(stats)
           end,
    '5' => lambda do |stats|
             @move_ob.drink_with_marginals!(stats)
           end,
    '6' => lambda do |stats|
             @move_ob.sing_in_metro!(stats)
           end,
    '7' => lambda do |stats|
             @move_ob.go_to_sleep!(stats)
           end,
    '8' => lambda do |stats|
             stats
           end
  }

  def self.move(stats, step)
    @move_ob = Move.new
    @act[step.to_s].call(stats)
  end
end
