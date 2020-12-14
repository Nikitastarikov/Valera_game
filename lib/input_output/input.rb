module Input
  attr_accessor :step

  def data_input(step, begin_n, end_n)
    loop do
      print "\ninput: "
      step = gets.chomp.to_i

      break if (step >= begin_n) && (step <= end_n)

      puts "write the number of the action [#{begin_n}; #{end_n}]"
    end
    step
  end
end
