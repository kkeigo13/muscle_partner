class AddMenuToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :user_id, :string
    add_column :menus, :menu, :string
    add_column :menus, :user_visible, :integer
  end
end
