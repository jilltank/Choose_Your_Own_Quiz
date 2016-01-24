def valid_num_of_questions
	puts 'How many questions do you want to enter?'
	@num_of_questions = gets.chomp
	if @num_of_questions.include?('.') || @num_of_questions.to_i == 0
		puts 'Invalid response. Please try again.'
		puts ' '
		valid_num_of_questions
	else
		@num_of_questions = @num_of_questions.to_i
	end
end

@questions_and_answers = {}

def write_the_questions
	@num_of_questions.times do
		puts 'What is the question?'
		q = gets.chomp
		puts 'What is the correct answer?'
		a = gets.chomp.downcase
		@questions_and_answers[q] = a
	end
end

def prompt
	puts "Please answer the following questions."
end

def quiz
	@questions_and_answers.each do |q, a|
		puts q
		user = gets.chomp.downcase
		if a == user
			@score += 1
		else
			@score += 0
		end
	end
end

def main
	puts "This program allows you to create a set of questions and answers, then it quizzes you on your scores. I hope you score well!"
	valid_num_of_questions
	write_the_questions
	system "cls"
	@score = 0
	prompt
	quiz
	puts "Your score is #{@score}/#{@num_of_questions}"
end

main
