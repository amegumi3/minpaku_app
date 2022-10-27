class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "新規投稿をしました"
      redirect_to :rooms
    else
      render "new"
      flash[:notice] = "新規投稿できませんでした"
    end    
  end

  def show
    @room = Room.find(params[:id])
  end  

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :price, :introduction, :adress, :room_image, :user_id)
  end  


end
