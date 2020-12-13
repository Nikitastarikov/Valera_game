require_relative 'lib/valera'
require_relative 'lib/menu/menu'
require_relative 'lib/actions/actions'
require_relative 'lib/menu/save_or_load_the_game/saver'
require_relative 'lib/menu/save_or_load_the_game/loader'

class Game
  attr_accessor :valera, :menu, :actions

  def initialize
    @valera = Valera.new
    @menu = Menu.new
    @actions = Actions.new
  end

  def go_igrat
    @valera = @menu.menu(true, @valera)
    loop do
      @valera.print_stats
      @actions.print_actions(@valera.stats)

      if @actions.menu_flag == true
        @valera = @menu.menu(false, @valera)
        @actions.menu_flag = false
      else
        @valera = @actions.move(@valera)
      end

      next unless @valera.stats['alive'] == false

      system('clear')
      game_over
      @valera = @menu.menu(true, @valera)
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
game.go_igrat
