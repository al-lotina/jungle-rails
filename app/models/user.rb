class User < ActiveRecord::Base
  has_secure_password


  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  validates_length_of :password, in: 3..30
end
