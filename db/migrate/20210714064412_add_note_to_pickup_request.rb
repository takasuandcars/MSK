class AddNoteToPickupRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :pickup_requests, :note, :text
  end
end
