class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    # If user exists / password correct.
    if @user
      # Save user id
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        # User's login doesn't work = send to login form.
        redirect_to '/signup'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def show

   @messages = params[:messages]
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin, :attraction_id)
  end

end
