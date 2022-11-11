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
      flash[:success] = "新規投稿をしました"
      redirect_to :rooms
    else
      flash[:danger] = "新規投稿できませんでした"
      render "new"
    end    
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end  

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    if params[:content] == "東京"
      @rooms = Room.where("adress like ?", "東京%")
    elsif params[:content] == "大阪"
      @rooms = Room.where("adress like ?", "大阪%")
    elsif params[:content] == "京都"
      @rooms = Room.where("adress like ?", "京都%")   
    elsif params[:content] == "北海道"
      @rooms = Room.where("adress like ?", "北海道%")       
    else  
    @q = Room.ransack(params[:q])
    @rooms = @q.result
    end
  end  

  private
  def room_params
    params.require(:room).permit(:name, :price, :introduction, :adress, :room_image, :user_id)
  end  

end
