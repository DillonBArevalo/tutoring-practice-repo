# -------R E G I S T R A T I O N----------
# new
get '/users/new' do
  # will need a view
  @user = User.new
  erb :'users/new'
end

# create
post '/users' do
  # will need to create a new user
  @user = User.new(params[:user])
  # will need to save new user
  # tries to put it in the database, runs the validations
  if @user.save
  # redirect if you successfully save the user
  session[:id] = @user.id
  redirect '/'
  # otherwise display the errors
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# show
# visit localhost:9393/users/4
# key is :id
# value is 4
get '/users/:id' do
  # get a user from the id
  @user = User.find(params[:id])
  # will need a view
  erb :'users/show'
end



