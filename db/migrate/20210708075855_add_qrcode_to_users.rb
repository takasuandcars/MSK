class AddQrcodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :qrcode, :integer
  end
end
