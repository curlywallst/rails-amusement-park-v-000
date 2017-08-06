class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    # If user exists / password correct.
    if user
      # Save user id
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
    # User's login doesn't work = send to login form.
      redirect_to '/signin'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
