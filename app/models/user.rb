class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :language_pref, presence: true
  validates :password_digest, presence: true
end
