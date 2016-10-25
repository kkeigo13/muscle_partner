class RenameCountToMenuCount < ActiveRecord::Migration
  def change
    rename_column :tweets, :count, :menu_count
  end
end
