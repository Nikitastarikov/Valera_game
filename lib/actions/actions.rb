require_relative '../input'

class Actions
	include Input
	attr_accessor :menu_flag

	def work(stats)
		stats['fun'] -= 5
		stats['mana'] -= 30
		stats['money'] += 100
		stats['fatigue'] += 70
		stats
	end

	def to_contemplate_nature(stats)
		stats['fun'] += 1
		stats['mana'] -= 10
		stats['fatigue'] += 10
		stats
	end

	def relax_at_home(stats)
		stats['fun'] -= 1
		stats['mana'] += 30
		stats['fatigue'] += 10
		stats['health'] -= 5
		stats['money'] -= 20
		stats
	end

	def go_in_bar(stats)
		stats['fun'] += 1
		stats['mana'] += 60
		stats['fatigue'] += 40
		stats['health'] -= 10
		stats['money'] -= 100
		stats
	end

	def drink_with_marginals(stats)
		stats['fun'] += 5
		stats['mana'] += 90
		stats['fatigue'] += 80
		stats['health'] -= 80
		stats['money'] -= 150
		stats
	end

	def sing_in_metro(stats)
		stats['money'] += 50 if (stats['mana'] > 40) && (stats['mana'] < 70)
		stats['fun'] += 1
		stats['mana'] += 10
		stats['fatigue'] += 20
		stats['money'] += 10
		stats
	end

	def go_to_sleep(stats)
		stats['health'] += 90 if stats['mana'] < 30
		stats['fun'] -= 3 if stats['mana'] > 70
		stats['mana'] -= 50
		stats['fatigue'] -= 70
		stats
	end

	def move(valera)
		action_n = 0
		loop do
			action_n = data_input(action_n, 1, 8)

			case action_n
			when 1
				break if (valera.stats['mana'] < 50) && (valera.stats['fatigue'] < 10)
			when 3
				break if valera.stats['money'] >= 20
			when 4
				break if valera.stats['money'] >= 100
			when 5
				break if valera.stats['money'] >= 150
			else
				break
			end

		end
		valera.stats = player_actions(action_n, valera.stats)
		valera.condition_repairs
		valera.check_condition
		valera
	end

	def player_actions(action_n, stats)
		case action_n
		when 1
			stats = work(stats)
		when 2
			stats = to_contemplate_nature(stats)
		when 3
			stats = relax_at_home(stats)
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
		puts "what are we going to do?"
		print "1 - work "
		if !((stats['mana'] < 50) && (stats['fatigue'] < 10)) 
			print "(can't, because you buhoy and ustal)"
		end
		puts "\n2 - to contemplate nature"

		print "3 - relax at home "
		no_money(stats, 20)

		print "\n4 - go in bar "
		no_money(stats, 100)

		print "\n5 - drink with marginals "
		no_money(stats, 150)

		puts "\n6 - sing in metro"
		puts "7 - go to sleep"
		puts "8 - menu"
	end

	def no_money(stats, money)
		if stats['money'] < money
			print "(can't, because not enough money)"
		end
	end
end