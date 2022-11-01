class Venue < ApplicationRecord
  has_many :gigs
  has_many :bands, through: :gigs

  validates :name, presence: true, uniqueness: true
end
