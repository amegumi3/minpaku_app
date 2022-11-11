module CommonModule
  extend ActiveSupport::Concern
  
    def set_searches
      @q = Room.ransack(params[:q])
    end
  
  end