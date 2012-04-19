class AddOffsetToLists < ActiveRecord::Migration
  def change
    add_column :lists, :offset, :integer

  end
end
