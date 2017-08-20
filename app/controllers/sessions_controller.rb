get '/login' do 
  @user = User.new
  erb :'sessions/login'
end 

post '/login' do 
  # check if the thing is what we think it is and save it, otherwise reshow the form with errors
  
  @user = User.find_by(username: params[:username])
  # looked to form, form gave us access to username. we then used params[:username] to access the value. and used that value to find the user
  # if we found a user, and they passed the authentication(had the right password), we gave the session a user id.
  # it was .id because it is an attribute of the user
  # .id is the reader method for the attribute
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
  else 
    # normally it would be @errors = @user.errors.full_messages
    @errors = ['username or password is incorrect']
    erb :'sessions/login'
  end 
end 

# redirects do need / beforehand
# erbs do not need / beforehand