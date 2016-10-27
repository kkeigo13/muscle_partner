class ChangeColumnNullToTweets < ActiveRecord::Migration
  def change
    change_column_null :tweets, :remarks, false
  end
end
