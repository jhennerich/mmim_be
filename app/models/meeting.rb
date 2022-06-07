class Meeting < ApplicationRecord
  validates :status, presence: true, numericality: { only_integer: true }
#  validates :place_id, presence: true

  has_many :user_meetings
  has_many :users, through: :user_meetings

  enum status: {
    'pending'=> 0,
    'accepted' => 1,
    'declined' => 2
}, _prefix: true
###
# _prefix allows for
# meeting.status_pending? # status == 'pending'
# meeting.status_accepted! # update(status: :active)
# meeting.status_declined # meeting.where(status: :declined)
###
end
