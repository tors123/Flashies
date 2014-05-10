class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #use the Sessions helper functions in controllers is to include the module for authenticationule into the Application controller
  include SessionsHelper   
end
