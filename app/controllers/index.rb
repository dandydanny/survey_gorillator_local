enable :sessions

get '/' do
  erb :index
end

get '/survey_list' do 
	
	erb :survey_list 
end 

post '/log_in' do 
	@user = User.find_by_email(params[:email])
	if @user && @user.authenticate(params[:password]) 
	session[:user_id] = @user.id
	redirect to('/user_portal')
	else
		redirect to('/')
	end
end

get "/logout" do 
	session.clear
	redirect to('/')
end

get '/signup' do
	erb :signup
end

post '/signup' do
	# create user with data given
		@user = User.create(email: params[:email], 
											password: params[:password],
											password_confirmation: params[:password])
		session[:user_id] = @user.id
	redirect to('/user_portal')
end

get '/user_portal' do
	if session[:user_id] == nil
		redirect to("/")
	else
		erb :user_portal
	end
end

get '/take_survey/:id' do
	@survey = Survey.find(params[:id])
	erb :take_survey
end

post '/take_survey' do
	# binding.pry
	p params
	TakenSurvey.create(:survey_id => params[:survey_id], :user_id => session[:user_id])
	# store question id
	# strip the button value
	# iterate through the rest
	params.each do |question_id, answer_id|
		if question_id.length < 3
		ChosenAnswer.create(question_id: question_id.to_i,
			user_id: session[:user_id],
			possible_answer_id: answer_id.to_i)
		end

	end    
      
	redirect to('/user_portal')
end

get '/create_survey' do 
	if request.xhr?
		erb :create_survey, :layout => false 
	else 
		erb :create_survey
	end
end # xhr? returns true if the request is made via ajax. I want it to return false if it was an ajax request so I use the bang.

post '/create_survey' do
	survey = Survey.create(title: params[:title], user_id: session[:user_id])
	redirect to("/create_question/#{survey.id}")
end

get '/create_question/:id' do 
	p params[:id]
	@possible_answer = PossibleAnswer.all
	erb :create_question
end

post "/create_question" do
	# Question.create(survey_id:    , text:  )
	redirect to('/create_survey')
end

# ================== Daniel's additions ===============

get '/stats/:id' do

	if session[:user_id] == nil
		redirect to("/")
	else
		p params[:id]
		@survey = Survey.find(params[:id])
		# @survey.questions
		#@question = Survey.find(params[:id]).questions
		# @answer = Survey.find(params[:id]).questions.find(1).possible_answers
		@chosenanswer = ChosenAnswer.all
		puts "-------------------------"
		p @chosenanswer
	# 	p @survey
	# 	p @question
	# 	# P @answer
		erb :stats
	end
  
end
