class EntriesController < ApplicationController
  def create
    @room = Room.find_by(id: params[:entry][:room_id])
    user_ids = params[:entry][:user_ids]

    user_ids.each do |u|
      entry = Entry.new(user_id: u, room_id: @room.id)
      entry.save
    end
    redirect_to room_path(@room)
  end
end
