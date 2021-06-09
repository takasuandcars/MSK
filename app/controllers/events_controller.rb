class EventsController < ApplicationController
  def index
    
    @events = PickupRequest.all
    respond_to do | format |
      format.html
      format.json
    end
  end
end
