class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity

  validates :user_id, :activity_id, presence: true
  validates :user_id, uniqueness: { message: 'cannot join same activity twice', scope: :activity_id }

end
