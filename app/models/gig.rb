class Gig < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  validates :date, presence: true
  validates :band_id, presence: true
  validates :venue_id, presence: true
end
