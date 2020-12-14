require_relative 'save_or_load_the_game/saver'
require_relative 'save_or_load_the_game/loader'
require_relative '../input_output/output'
require_relative '../input_output/input'

class Menu
  include Input
  include Output
  attr_accessor :step

  def menu(flag, valera)
    @step = 0
    print_menu(flag)
    @step = if flag == true
              data_input(@step, 1, 3)
            else
              data_input(@step, 1, 5)
            end

    case @step
    when 1
      valera = Valera.new
    when 2
      valera = load(flag, valera)
    when 3
      save(flag, valera)
    when 5
      system('clear')
      puts 'pokeda'
      exit
    end
    valera
  end

  def load(flag, valera)
    system('clear')
    print 'enter loade file: '
    file_name = gets.chomp.to_s
    @loader = Loader.new(file_name)
    system('clear')
    if @loader.valid?
      valera = @loader.load
      print 'download was successful'
      sleep 2
    else
      print 'there is no such file'
      sleep 2
      valera = menu(flag, valera)
    end
    valera
  end

  def save(flag, valera)
    system('clear')
    if flag
      puts 'pokeda'
      exit
    else
      print 'enter save file: '
      file_name = gets.chomp.to_s
      @saver = Saver.new(file_name, valera)
      @saver.save
    end
  end
end
