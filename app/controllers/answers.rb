get '/answers' do

    erb :'answers/index'
end

get '/answers/new' do
  erb :'answers/new'
end

get '/answers/:id' do
  @answer = Answer.find(params[:id]) #define instance variable for view
  erb :'answers/show' #show single user view
end


post '/answers' do
  # binding.pry
  @answer = Answer.new(params[:answer])

  if @answer.save
    redirect "/answers/#{@answer.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/new'
  end
end

delete '/answers/:id' do
  question = Answer.find_by(id: params[:id])
  if answer
    answer.destroy
    redirect '/answers'
  end
end
