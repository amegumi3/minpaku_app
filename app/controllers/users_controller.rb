class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      flash[:notice] = "更新しました"
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
