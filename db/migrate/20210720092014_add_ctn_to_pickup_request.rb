class AddCtnToPickupRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :pickup_requests, :ctn, :integer
  end
end
