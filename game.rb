require_relative 'lib/valera'
require_relative 'lib/menu/menu'
require_relative 'lib/actions/actions'
require_relative 'lib/output/output'
require_relative 'lib/input'

class Game
  include Input
  include Output
  attr_accessor :valera, :menu, :actions, :menu_flag

  def initialize
    @valera = Valera.new
    @menu = Menu.new
  end

  def start_game
    @valera = @menu.menu(true, @valera)
    loop do
      print_stats(@valera.stats)
      print_actions(@valera.stats)
      motion
      next unless @valera.stats['alive'] == false

      system('clear')
      game_over
      @valera = @menu.menu(true, @valera)
    end
  end

  def motion
    if @menu_flag == true
      @valera = @menu.menu(false, @valera)
      @menu_flag = false
    else
      step = data_input(step, 1, 8)
      @menu_flag = true if step == 8
      valera.stats = Actions.move(valera, step)
      valera.condition_repairs
      valera.check_condition
    end
  end

  def game_over
    puts "\tGAME OVER"
    print "\n"
    if @valera.check_hp
      puts 'Valera prosto pomer, zemly betonom'
    elsif @valera.check_fun
      puts "Valera was in misfortune for a long time and \nhe decided to commit suicide"
    elsif @valera.check_mana
      puts "excess mana awakened magical abilities, \nValera went to Hogwarts(belka karoche)"
    elsif @valera.check_fatigue
      puts 'Valera pomer of fatigue, zemly betonom'
    end
    sleep 5
  end
end
game = Game.new
game.start_game
