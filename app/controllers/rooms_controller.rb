class RoomsController < ApplicationController
  
  def new
    @room = Room.new
  end

#   def create
#   end

#   private
#   def configure_permitted_parameter
#     params.require(:room)
#    end
end
