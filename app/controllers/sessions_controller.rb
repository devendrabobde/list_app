class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url :notice => "You Are Now Ligged In"
    else
      flash.now.alert = "Invalid Email or Password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url :notice => "Logged Out Successfully!"
  end
end
