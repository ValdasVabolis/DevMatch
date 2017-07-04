class Profile < ActiveRecord::Base
  # each profile belongs to user (connects to user class)
  belongs_to :user
end