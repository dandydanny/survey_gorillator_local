require 'faker'
# <<<<<<< HEAD

@all_users = []
@all_surveys = []

20.times do 
	email = Faker::Internet.email 
	@all_users << User.create(email: email, password: "password", password_confirmation: "password")
end

2.times do 
	title = Faker::Name.title 
	user_id = rand(1..20)
	draft_status = true 
	@all_surveys << Survey.create(title: title, user_id: user_id, draft_status: draft_status)
end
# =======
# >>>>>>> oliver_experiment


# one user creates the surveys
# user = User.create email: "awesomedude@gmail.com", password: "1234"
# survey = Survey.create title: "first_survey", user: user, draft_status: nil
# # <<<<<<< HEAD
# # question = Question.create survey: survey, text: "first_question"
# # =======
# survey2 = Survey.create title: "second_survey", user: user, draft_status: nil
# survey3 = Survey.create title: "third_survey", user: user, draft_status: nil


# # # # question = Question.create survey: survey, text: "What do you want for lunch today?"

# # # # first_possible_answer = PossibleAnswer.create text: "yes", question: question 
# # # # second_possible_answer = PossibleAnswer.create text: "No", question: question 

# # # # chosen_answer = ChosenAnswer.create question: question, user: user, possible_answer: first_possible_answer

# # # # taken_survey = TakenSurvey.create survey: survey, user: user 

Survey.all.each do |survey|
	file_path = 'Useful_Documentation_Folder/Daniels_example_Survey.md'
	file = File.open(File.expand_path(file_path)).read
	file.each_line do |line|
		if line.include?("?")
			line = line.strip
			@question = Question.create(survey: survey, text: line)
		elsif line == "\n"
			next
		else
			line = line.strip
			PossibleAnswer.create(question: @question, text: line)
		end
	end
end

# 10.times do 
# 	user = User.create(email: Faker::Internet.email)
# end

User.all.each do |user|
	Survey.all.each do |survey|
		survey.questions.each do |question|
			ChosenAnswer.create(question_id: question.id, user_id: user.id, possible_answer_id: question.possible_answers.sample.id)
		end
	end
end
	# Question.all.each do |question|

# >>>>>>> oliver_experiment



# <<<<<<< HEAD
# chosen_answer = ChosenAnswer.create question: question, user: user, possible_answer: first_possible_answer
# taken_survey = TakenSurvey.create survey: survey, user: user 
# =======

# >>>>>>> oliver_experiment
