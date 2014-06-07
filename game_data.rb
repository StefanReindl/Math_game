@player_lives = {
	Player1: 3,
	Player2: 3
}

@player_scores = {
	Player1: 0,
	Player2: 0
}

@current_player = "Player1"

def generate_question
	@question = ""
	interger1 = rand(1..10)
	interger2 = rand(1..10)
	operator = ["+", "-", "*", "/"].sample
	@question << interger1.to_s
	@question << operator
	@question << interger2.to_s
	@answer = eval(@question).to_i
end

def modify_player_data
	if @current_player == "Player1" && @player_guess == @answer
		@player_scores[:Player1] += 10
	elsif @current_player == "Player1" && @player_guess != @answer
		@player_lives[:Player1] -= 1
	elsif @current_player == "Player2" && @player_guess == @answer
		@player_scores[:Player2] += 10
	elsif @current_player == "Player2" && @player_guess != @answer
		@player_lives[:Player2] -= 1
	end
end

def current_player_score
	if @current_player == "Player1"
		return "#{@current_player} now has #{@player_scores[:Player1]} points and #{@player_lives[:Player1]} lives."
	else
		"#{@current_player} now has #{@player_scores[:Player2]} points and #{@player_lives[:Player2]} lives."
	end
end

def switch_player
	if @current_player == "Player1"
		@current_player = "Player2"
	else
		@current_player = "Player1"
	end
end

def still_alive?
	(@player_lives[:Player1] >= 1) && (@player_lives[:Player2] >= 1)
end

def continue?
	puts "Enter 'c' to continue."
	c = gets.chomp.downcase
	if c == 'c'
		system "clear"
		return
	else 
		puts "Sorry, try entering 'c' again."
		c = gets.chomp.downcase
	end
end

def game_over
	if @player_scores[:Player1] > @player_scores[:Player2]
		return "Player1 wins with #{@player_scores[:Player1]} points!"
	else
		return "Player2 wins with #{@player_scores[:Player2]} points!"
	end
end

def play_again?
	again = gets.chomp.downcase
	if again == "y"
		@player_scores[:Player1] == 0
		@player_scores[:Player2] == 0
		@player_lives[:Player1] += 3
		@player_lives[:Player2] += 3
	elsif again == "n"
		abort("Good-bye")
	else
		puts "Sorry, try typing y or n."
		again = gets.chomp.downcase
	end
end
