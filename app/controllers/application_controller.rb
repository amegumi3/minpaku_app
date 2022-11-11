class ApplicationController < ActionController::Base
  include CommonModule
  before_action :set_searches
  add_flash_types :success,:danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :search]


  private 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end  
end
