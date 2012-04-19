class AddExpiresToLists < ActiveRecord::Migration
  def change
    add_column :lists, :expires, :boolean

  end
end
