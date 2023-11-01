class Party < ApplicationRecord
  validates :access_code, presence: true, uniqueness: true
  validates :max_rating, presence: true
  validates :max_duration, presence: true
  validates :genres, presence: true
  validates :services, presence: true
  validates :languages, presence: true
  validates :format, presence: true
  validates :movie_id, presence: true
end