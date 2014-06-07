require './game_data'
require 'pry'

@start_message = <<-eos
 Amazing Math Game for Two!
 --------------------------
 Type 'start' to begin. 
 eos

puts @start_message
start_input = gets.chomp.downcase

if start_input == "start"
	puts "Let's begin!"
else
	puts "Try again."
	start_input = gets.chomp.downcase
end

system "clear"

loop do
	if still_alive?
		generate_question
		puts "#{@current_player}'s turn!"
		puts "What does #{@question} equal?"
		@player_guess = gets.chomp.to_i
			if @player_guess == @answer
				puts "Nice!"
				modify_player_data
				puts current_player_score
			else
				puts "BZZZT! WRONG-O! The correct answer is #{@answer}"
				modify_player_data
				puts current_player_score
			end
			puts continue?
			switch_player
	else
		puts game_over
		puts "Play again? (y/n)"
		play_again?
	end
end


