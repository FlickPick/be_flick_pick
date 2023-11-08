class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  has_many :temp_users
  has_many :liked_movies, through: :temp

  before_validation :generate_access_code

  validates :access_code, presence: true, uniqueness: true
  validates :max_rating, presence: true
  validates :max_duration, presence: true
  validates :genres, presence: true
  validates :services, presence: true

  private

  def generate_access_code
    unless self.access_code
      loop do
        self.access_code = SecureRandom.hex(3)
        break unless Party.exists?(:access_code => access_code)
      end
    end
  end
end