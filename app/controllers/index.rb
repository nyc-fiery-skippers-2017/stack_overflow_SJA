get '/' do
  @questions = Question.all
  @votes = Vote.all
  @answer = Answer.all
  erb :index
end
