class Contact < ActiveRecord::Base
  # make sure contact form contains these fields
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end