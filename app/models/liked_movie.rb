class LikedMovie < ApplicationRecord
  belongs_to :temp_user
  belongs_to :party, through: :temp_user

  validates :movie_id, presence: true
  validates :round, presence: true
end
