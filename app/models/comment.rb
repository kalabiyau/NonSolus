class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity

  validates :activity, :user, presence: true
  validates :content, length: { maximum: 140, minimum: 1 }
  default_scope { includes(:user) }

end
