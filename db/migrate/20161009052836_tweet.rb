class Tweet < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer, null:false
    add_column :tweets, :menu_name, :string, null:false
    add_column :tweets, :count, :integer, null:false
    add_column :tweets, :remarks, :text, null:false
    add_column :tweets, :work_date, :date, null:false
  end
end
