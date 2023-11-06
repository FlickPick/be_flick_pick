class TempUser < ApplicationRecord
  belongs_to :party
  has_many :liked_movies

  validates :name, presence: true
end