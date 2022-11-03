class UsersController < ApplicationController
  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update_resource
    binding.pry
    if #@user.update
      flash[:notice] = "更新しました"
      redirect_to edit_user_path
      binding.pry
    else
      render "edit"
    end  

  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
