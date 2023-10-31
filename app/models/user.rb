class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniquness: true
  validates :role, presence: true
  validates :language_pref, presence: true
  validates :movie_history, presence: true
  validates :password_digest, presence: true
end
