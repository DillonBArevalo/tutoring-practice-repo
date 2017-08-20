helpers do
  def logged_in?
    session[:id] != nil
    # if session id is not equal to nil
    # !!session[:id]
    # !!session[:id] gives you the truth value of session[:id]
  end

  def current_user
    # get the user, or run the find to find the user
    # if someone is logged in
    # useful example: to see if a post belongs to the current user...to know if we want to put an edit or delete button
    (@user ||= User.find(session[:id])) if logged_in?
  end
end
