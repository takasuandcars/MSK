class AddDetailsToPickupRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :pickup_requests, :type, :string
    add_column :pickup_requests, :number_of_car, :integer
    add_column :pickup_requests, :weight, :integer
  end
end
