class LikedMovie < ApplicationRecord
  belongs_to :temp_user

  validates :movie_id, presence: true
  validates :round, presence: true
end