class ReceivedsController < ApplicationController
    
    def new
        @received = Received.new
    end
    
    
end
