module SessionsHelper
  
  #the sign in function for users to sign in
  def sign_in(user)
    #create a new token
    remember_token = User.new_remember_token
    #place the token in the browser - lifespan of permanent: 20 years!
    cookies.permanent[:remember_token] = remember_token
    #save the hashed token to the database
    #update attribute allows to bypass validations (password & confirmaation)
    user.update_attribute(:remember_token, User.digest(remember_token))
    #set as current user - without self, Ruby would simply create a local variable called current_user
    self.current_user = user
  end
  
  #signed in boolean tells if a current user is signed in.
  #"A user is signed in if there is a current user in the session, i.e., if current_user is non-nil"
  def signed_in?
    !current_user.nil?
  end
  
  #sign the user out
  def sign_out
    #change the user’s remember token in the database (in case the cookie has been stolen, as it could still be used to authorize a user)
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    #delete cookies to remove the remember token from the session
    cookies.delete(:remember_token)
    self.current_user = nil  
  end
  
  #special syntax for defining assignment function
  #defines a method current_user= expressly designed to handle assignment to current_user
  def current_user=(user)
    @current_user = user
  end
  
  #return the value of @current_user
  def current_user
    #get the token for the current user by getting it from the browser and hashing it to match the db
    remember_token = User.digest(cookies[:remember_token]) 
    #the following line calls the find_by method the first time current_user is called, but on subsequent invocations returns @current_user without hitting the database
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  #boolean to tell if the current user is the user
  def current_user?(user)
    user == current_user
  end
  
  # if not signed in, redirect.
  # uses shortcut for setting flash[:notice] by passing an options hash to the redirect_to function
  def sign_in_user
    #if we are not signed in allready
    unless signed_in?
      #get the stored location of where the user was trying to go
      store_location
      redirect_to signin_url, notice: "Please sign in. user_contr"
    end
  end

  #---forwarding---
  #redirect to the requested URL if it exists
  #if the user tries to go to a page they need to sign in for, if they sign in, forward them on to
  #the page they wanted to go to, otherwise, rediret back to default
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end  
  
  #store the page the user is trying to go to, in case they dont have access (are not signed in)
  #stores in a session (window lifetime cookie) under the variable name "return_to"
  #only retrievable by a 'GET' request
  def store_location
    session[:return_to] = request.url if request.get?
  end
end
