class RoomsController < ApplicationController
    
    def index 
        @messages = DirectMessage.all
        @message = DirectMessage.new
    end
    
end
