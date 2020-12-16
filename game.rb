require_relative 'lib/valera'
require_relative 'lib/menu/menu'
require_relative 'lib/actions/actions'
require_relative 'lib/input_output/output'
require_relative 'lib/input_output/input'

class Game
  include Input
  include Output
  attr_accessor :valera, :menu, :menu_flag

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
      game_over(valera)
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
      valera.stats = Actions.move(valera.stats, step)
      valera.condition_repairs!
      valera.check_condition!
    end
  end
end
game = Game.new
game.start_game
