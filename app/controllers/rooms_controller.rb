class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end
end
