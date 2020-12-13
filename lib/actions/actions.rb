require_relative '../input'
require_relative '../valera'
require_relative 'move'

class Actions
  include Input
  include Move
  attr_accessor :menu_flag, :step

  def move(valera)
    move_input(valera)
    valera.stats = player_actions(valera.stats)
    valera.condition_repairs
    valera.check_condition
    valera
  end

  def move_input(valera)
    loop do
      @step = data_input(@step, 1, 8)
      case @step
      when 1
        break if (valera.stats['mana'] < 50) && (valera.stats['fatigue'] < 10)
      when 3
        break if valera.stats['money'] >= 20
      end
      break if check_move(valera)
    end
  end

  def check_move(valera)
    case @step
    when 4
      return true if valera.stats['money'] >= 100
    when 5
      return true if valera.stats['money'] >= 150
    else
      return true
    end
    false
  end

  def player_actions(stats)
    case @step
    when 1
      work(stats)
    when 2
      to_contemplate_nature(stats)
    when 3
      relax_at_home(stats)
    else
      player_actions_two(stats)
    end
  end

  def player_actions_two(stats)
    case @step
    when 4
      stats = go_in_bar(stats)
    when 5
      stats = drink_with_marginals(stats)
    when 6
      stats = sing_in_metro(stats)
    when 7
      stats = go_to_sleep(stats)
    when 8
      @menu_flag = true
    end
    stats
  end

  def print_actions(stats)
    puts 'what are we going to do?'
    print '1 - work '
    print "(can't, because you buhoy and ustal)" unless (stats['mana'] < 50) && (stats['fatigue'] < 10)
    puts "\n2 - to contemplate nature"
    print '3 - relax at home '
    no_money(stats, 20)
    print "\n4 - go in bar "
    no_money(stats, 100)
    print "\n5 - drink with marginals "
    no_money(stats, 150)
    puts "\n6 - sing in metro"
    puts '7 - go to sleep'
    puts '8 - menu'
  end

  def no_money(stats, money)
    print "(can't, because not enough money)" if stats['money'] < money
  end
end
