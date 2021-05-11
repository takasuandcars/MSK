class CreateReceiveds < ActiveRecord::Migration[6.0]
  def change
    create_table :receiveds do |t|
      t.date :received_date
      t.string :awb
      t.string :invoice
      t.boolean :inspection
      t.boolean :shipping
      t.date :shipped_date
      t.integer :number_of_order

      t.timestamps
    end
  end
end
