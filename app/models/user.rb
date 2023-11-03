class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  # validates :password, presence: true
  validates_presence_of :password

  has_secure_password
end
