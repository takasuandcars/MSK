class RenameTypeColumnToPickupRequests < ActiveRecord::Migration[6.0]
  def change
    rename_column :pickup_requests, :type, :car_type
  end
end
