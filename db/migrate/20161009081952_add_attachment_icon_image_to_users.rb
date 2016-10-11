class AddAttachmentIconImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :icon_image
    end
  end

  def self.down
    remove_attachment :users, :icon_image
  end
end
