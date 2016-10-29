class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :icon_image,
                      stylese: {medium: "300x300#", thumb: "100x100#"}
  validates_attachment_content_type :icon_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]



  has_many :menus
  has_many :tweets
end
