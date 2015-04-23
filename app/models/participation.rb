class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity

  validates :user_id, :activity_id, presence: true
  validates :user_id, uniqueness: { message: 'cannot join same activity twice', scope: :activity_id }
  validate :activity_not_yet_full

  private

  def activity_not_yet_full
    errors.add(:activity, 'is fully booked') if activity.full?
  end

end
