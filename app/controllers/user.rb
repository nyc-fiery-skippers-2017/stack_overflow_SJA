# get '/users' do
#   @users = User.all #define instance variable for view
#   erb :'users/index' #show all users view (index)
# end

# New user form route
get '/users/new' do
  erb :'users/new' #show new users view
end

# New user post route
post '/users/new' do
  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user
  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users/login' #redirect back to users index page
  else
    erb :'users/new' # show new users view again(potentially displaying errors)
  end
end

# Login Page
get '/users/login' do
  erb :'/users/login'
end

# Login page form data
post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    erb :'/users/login'
  end
end

# Show specific user page
get '/users/:id' do
  #gets params from url
  @user = User.find(params[:id]) #define instance variable for view
  erb :'users/show' #show single user view
end

# Logout Route
get '/users/logout' do
  session.clear
  redirect '/'
end
