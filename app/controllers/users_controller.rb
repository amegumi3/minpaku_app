class UsersController < ApplicationController
  def show
    @q = Room.ransack(params[:q])
    @user = User.find(current_user.id)
  end

  def edit
    @q = Room.ransack(params[:q])
    @user = User.find(current_user.id)
  end

  def update
    @q = Room.ransack(params[:q])
    @user = User.find(params[:id])
    if @user.update(update_params)
      flash[:success] = "更新しました"
      redirect_to edit_user_path
    else
      render "edit"
    end  
  end

  private
  def update_params
    params.require(:user).permit(:name, :introduction, :image)
  end  
end
