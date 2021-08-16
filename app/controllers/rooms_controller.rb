class RoomsController < ApplicationController
    
    def index 
        @user = current_user
        @messages = DirectMessage.all
        @message = DirectMessage.new
        @entries = @user.entries       
        @room = @user.rooms.new
    end
    
end
