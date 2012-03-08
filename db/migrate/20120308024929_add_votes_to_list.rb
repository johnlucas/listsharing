class AddVotesToList < ActiveRecord::Migration
  def change
    add_column :lists, :votes, :integer

  end
end
