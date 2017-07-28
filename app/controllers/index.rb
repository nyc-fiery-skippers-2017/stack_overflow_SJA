get '/' do
  @questions = Question.all
  @votes = Vote.all
  @answer = Answer.all
  erb :index
end

post '/' do

  @user = current_user
  @question = Question.new(params[:question])
  @question.user_id = @user.id
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @question.errors.full_messages
    erb :index
  end
end
