class AddToPickupRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :pickup_requests, :cbm, :integer
  end
end
