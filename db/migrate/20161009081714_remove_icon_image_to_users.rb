class RemoveIconImageToUsers < ActiveRecord::Migration
  def change
        remove_column :users, :icon_image

  end
end
