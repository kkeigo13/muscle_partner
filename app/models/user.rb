class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:nick_name]
  has_attached_file :icon_image,
                      stylese: {medium: "300x300#", thumb: "100x100#"}
  validates_attachment_content_type :icon_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_uniqueness_of :nick_name
  validates_presence_of :nick_name
  #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["nick_name = :value", { :value => nick_name }]).first
    else
      where(conditions).first
    end
  end
  def email_required?
    false
  end

  def email_changed?
    false
  end
  has_many :menus
  has_many :tweets
end
