class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  def self.find_all_meetings(user_id)
    User.joins(:meetings)
    .where(id: "#{user_id}")
  end
end
