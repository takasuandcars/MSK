class AddColumnPickupRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :receiveds, :pickup_request_id, :integer
    
  end
end
