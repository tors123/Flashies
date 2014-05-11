class SessionsController < ApplicationController

  #new action for session -- points to rendering a 'new' view
  def new
    redirect_to(root_url) if current_user
  end

  # create action for a session
  # note that 'new' returns all info needed to authenticate users (passwords & names match)
  def create  
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect to users home page
      sign_in user
      #o redirect to the requested URL if it exists, or default URL (user page) otherwise
      redirect_back_or user
    
    else
      # create an error msg and re render the signin form
      # note "flash.now is specifically designed for displaying flash messages on rendered pages; 
      # unlike the contents of flash, its contents disappear as soon as there is an additional request" - http://www.railstutorial.org/book/sign_in_out
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # destroy action for a session
  #signs a user out (using a sessions helper) and sends back to home page
  def destroy  
    sign_out
    redirect_to root_url
  end
  
end
