get '/questions' do

    erb :'questions/index'
end


get '/questions/:id' do
  p params
  # @user = User.find(params[:id])
  @question = Question.find(params[:id]) #define instance variable for view
  erb :'questions/show' #show single user view

end
