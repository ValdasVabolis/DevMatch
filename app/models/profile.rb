class Profile < ActiveRecord::Base
  # each profile belongs to user (connects to user class)
  belongs_to :user
  # create association for image (imagemagick avatar)
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end