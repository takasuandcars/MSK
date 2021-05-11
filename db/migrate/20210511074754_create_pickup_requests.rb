class CreatePickupRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :pickup_requests do |t|
      t.date :pickup_date
      t.boolean :arrange
      t.boolean :car_number
      t.boolean :received
      t.integer :number_of_total_order

      t.timestamps
    end
  end
end
