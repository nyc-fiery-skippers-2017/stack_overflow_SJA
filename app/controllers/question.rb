get '/questions' do
    erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single user view
end


post '/questions' do
  # binding.pry
  @question = Question.new(params[:question])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
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
  @question = 
  @answer = Answer.new(params[:answer])
  @answer.user_id = @user.id


  if @answer.save
    redirect "/"
  else
    @answer.errors.full_messages
    erb :index
  end
end
