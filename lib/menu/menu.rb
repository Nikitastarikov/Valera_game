require_relative '../input'

class Menu
	include Input
	attr_accessor :step

	def print_menu(flag)
		system("clear")
		puts "\tMenu"
		puts "1 - New game"
		puts "2 - load game"
		if flag == true
			puts "3 - exit"
		else 
			puts "3 - save game"
			puts "4 - continue the game"
			puts "5 - exit"
		end
	end

	def menu(flag, valera)
		@step = 0;
		print_menu(flag)
		if flag == true
			@step = data_input(@step, 1, 3)
		else
			@step = data_input(@step, 1, 5)
		end	
		
		case @step
		when 1
			valera = Valera.new("config_start_game")
		when 2
			system("clear")
			print "enter loade file: "
			file_name = gets.chomp.to_s
			@loader = Loader.new(file_name)
			system("clear")
			if @loader.Valid?
				valera = @loader.load
				print "download was successful"
				sleep 2
			else
				print "there is no such file"
				sleep 2
				menu(flag, valera)
			end	
		when 3
			if flag 
				system("clear")
				puts "pokeda"
				exit
			else
				system("clear")
				print "enter save file: "
				file_name = gets.chomp.to_s
				@saver = Saver.new(file_name, valera)
				@saver.save
			end
		when 5
			system("clear")
			puts "pokeda"
			exit
		end
		valera
	end
end