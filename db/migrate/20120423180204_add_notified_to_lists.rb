class AddNotifiedToLists < ActiveRecord::Migration
  def change
    add_column :lists, :notified, :boolean

  end
end
