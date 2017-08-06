

class RidesController < ApplicationController

  def new
    @ride = Ride.new(:attraction_id => params[:attraction_id], :user_id => current_user.id)
    @messages = @ride.take_ride
    @user = current_user
    redirect_to user_path(@user, :messages => @messages)
  end
end
