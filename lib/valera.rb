require 'yaml'
require_relative 'menu/save_or_load_the_game/loader'

class Valera
	attr_accessor :stats 

	def initialize(path_to_file = "config_start_game")

		file_name = File.expand_path("#{path_to_file}.yaml", __dir__)

		@stats = YAML.safe_load(File.open(file_name))
		@stats['alive'] = true
	end

	def print_stats
		system("clear")
		puts "\tValera's condition:"
		puts "health = #{@stats['health']}" 
		puts "mana = #{@stats['mana']}" 
		puts "fun = #{@stats['fun']}" 
		puts "fatigue = #{@stats['fatigue']}" 
		puts "money = #{@stats['money']}"
		puts "-----------------------"
	end

	def condition_repairs
		@stats['health'] = 100 if @stats['health'] > 100
		@stats['fun'] = 10 if @stats['fun'] > 10
    	@stats['mana'] = 0 if (@stats['mana']).negative?
    	@stats['fatigue'] = 0 if (@stats['fatigue']).negative?
	end

	def check_condition
		if check_hp || check_fun \
			|| check_mana || check_fatigue
			@stats['alive'] = false
		end 
	end

	def check_hp
		@stats['health'] <= 0
	end

	def check_fun
		@stats['fun'] <= -10
	end

	def check_mana
		@stats['mana'] >= 100
	end

	def check_fatigue
		@stats['fatigue'] >= 100
	end
end