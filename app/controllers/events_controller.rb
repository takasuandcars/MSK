class EventsController < ApplicationController
  def index
    
    @events = PickupRequest.all
    respond_to do | format |
      format.html
      format.json
    end
  end
  
  def pickup
      @events = PickupRequest.all
      respond_to do | format |
      format.html
      format.json
      end
  end
  
  def received
    
    @events = Received.all.where(pickup_request_id: nil)
    respond_to do | format |
      format.html
      format.json
      end
  end
end
