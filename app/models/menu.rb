class Menu < ActiveRecord::Base
  validate :add_error_message
  belongs_to :user
  def add_error_message
    if menu.empty?
      errors.add("メニューを入力してください！")
    end
  end
end
