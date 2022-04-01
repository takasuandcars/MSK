class RoomsController < ApplicationController
    
    def index 
        @user = current_user
        @messages = DirectMessage.all
        @message = DirectMessage.new
        @entries = @user.entries       
        @room = @user.rooms.new
    end
    
    def show
        @room = Room.find_by(id: params[:id])
        @messages = @room.direct_messages.all
        @message = current_user.direct_messages.new
        @entry = @room.entries.new
        gon.room_id = @room.id
        @users = User.all
        
        
    end
    
    def create
        @room = Room.new(name: params[:room][:name])
        if @room.valid?
            @room.save
            @entry = current_user.entries.new(room_id: @room.id)
            @entry.save
        end
    end
    
end
