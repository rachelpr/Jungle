class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    #if the user exists and the password is correct redirect to home
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
     #else redirect to login 
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

end