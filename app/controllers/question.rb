get '/questions' do
    erb :'questions/index'
end


get '/questions/:id' do
  # @user = User.find(params[:id])
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single user view

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
