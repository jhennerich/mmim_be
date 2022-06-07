class Location < ApplicationRecord
  validates :meeting_id, presence: true
  validates :place_id, presence: true
#  validates :name, presence: true
#  validates :address, presence: true
#  validates :rating, presence: true
#  validates :img_url, presence: true
#  validates :price_range, presence: true

  belongs_to :meeting
end
