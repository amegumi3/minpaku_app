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
      flash.now[:danger] = "全ての項目を入力してください。"
      render template: "rooms/show"
    end
  end  

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if params[:back]
      render template: "rooms/show"
    elsif !@reservation.save
      render template: "rooms/show"
      flash.now[:danger] = "予約できませんでした"
    else 
      flash[:success] = "予約しました"
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