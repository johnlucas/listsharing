class AddExpiryDateToLists < ActiveRecord::Migration
  def change
    add_column :lists, :expiry_date, :datetime

  end
end
