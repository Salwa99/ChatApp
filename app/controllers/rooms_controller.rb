class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @room = Room.new
    @rooms = Room.public_rooms
    @single_room = Room.find(params[:id])
    @users = User.all_except(current_user)
    
  end

  def create
    @room = Room.create(room_params)  
  end



  
  private 

  def room_params
    params.require(:room).permit(:name)
  end
end


