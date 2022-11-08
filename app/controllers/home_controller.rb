class HomeController < ApplicationController
  def index
    @q = Room.ransack(params[:q])
    # @room = @q.result
  end
end
