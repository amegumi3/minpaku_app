class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def show
    
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.invalid?
      flash[:notice] = "入力漏れがあります"
      render template: "rooms/show"
    end
  end  

  def create
    @reservation = Reservation.new(reservation_params)
    if !@reservation.save
      binding.pry
       redirect_to rooms_path
      flash[:destroy] = "新規投稿できませんでした"
    else 
      flash[:success] = "新規投稿しました"
      redirect_to reservations_path
    end       
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end

private
def reservation_params
  params.require(:reservation).permit(:start_date, :end_date, :how_many,:room_id, :user_id)
end 