class AddListIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :list_id, :integer

  end
end
