class RemoveColumnToMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :user_id, :VARCHAR
  end
end
