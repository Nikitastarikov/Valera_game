require_relative '../valera'

module Output
  def print_menu(flag)
    system('clear')
    puts "\tMenu"
    puts '1 - New game'
    puts '2 - load game'
    if flag
      puts '3 - exit'
    else
      puts '3 - save game'
      puts '4 - continue the game'
      puts '5 - exit'
    end
  end

  def print_stats(stats)
    system('clear')
    puts "\tValera's condition:"
    puts "health = #{stats['health']}"
    puts "mana = #{stats['mana']}"
    puts "fun = #{stats['fun']}"
    puts "fatigue = #{stats['fatigue']}"
    puts "money = #{stats['money']}"
    puts '-----------------------'
  end

  def print_actions(stats)
    puts 'what are we going to do?'
    print '1 - work '
    print "(can't, because you buhoy or ustal)" unless (stats['mana'] < 50) && (stats['fatigue'] < 10)
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

  def game_over(valera)
    puts "\tGAME OVER"
    print "\n"
    if valera.check_hp
      puts 'Valera prosto pomer, zemly betonom'
    elsif valera.check_fun
      puts "Valera was in misfortune for a long time and \nhe decided to commit suicide"
    elsif valera.check_mana
      puts "excess mana awakened magical abilities, \nValera went to Hogwarts(belka karoche)"
    elsif valera.check_fatigue
      puts 'Valera pomer of fatigue, zemly betonom'
    end
    sleep 5
  end

  def no_money(stats, money)
    print "(can't, because not enough money)" if stats['money'] < money
  end
end
