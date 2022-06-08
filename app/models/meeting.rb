class Meeting < ApplicationRecord
  validates :location_name, presence: true
  validates :location_address, presence: true
  validates :host_name, presence: true
  validates :guest_name, presence: true

  has_many :user_meetings, dependent: :destroy
  has_many :users, through: :user_meetings
end
