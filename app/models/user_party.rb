class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :host, inclusion: [true, false]
end