class UserMeeting < ApplicationRecord
  belongs_to :user_id
  belongs_to :meeting_id
end
