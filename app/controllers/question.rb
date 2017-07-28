get '/questions' do
    erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:id])#define instance variable for view
  erb :'questions/show' #show single user view
end


post '/questions' do
  # binding.pry
  puts params
  @question = Question.new(params[:question])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = @question.id
  # puts  params[:id]
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/questions/show'
  end
end

delete '/questions/:id' do
  question = Question.find_by(id: params[:id])
  if question
    question.destroy
    redirect '/questions'
  end
end

post '/questions/show' do
  @user = current_user
  @answer = Answer.new(params[:answer])
  @answer.user_id = @user.id
  if @answer.save
    redirect "/"
  else
    @answer.errors.full_messages
    erb :index
  end
end

post '/questions/:id/voteup' do
  @question = Question.find(params[:id])
  vote = Vote.new(voteable: @question, vote_choice: true, user: current_user)
  if vote.save
    redirect "/questions/#{@question.id}"
  end
end


post '/questions/:id/votedown' do
  @question = Question.find(params[:id])
  vote = Vote.new(voteable: @question, vote_choice: false, user: current_user)
  if vote.save
    redirect "/questions/#{@question.id}"
  end
end
