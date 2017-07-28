get '/' do
  @questions = Question.all
  @votes = Vote.all
  @answer = Answer.all
  erb :index
end

post '/' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @question.errors.full_messages
    erb :index
  end
end
