class Activity < ActiveRecord::Base
  after_create :send_mail_to_subs

  has_and_belongs_to_many :users
  has_one :creator, class_name: User
  validates :name, presence: true
  validates :name, uniqueness: true

  def send_mail_to_subs
    User.where(subscriber: true).each do |user|
      Notifier.notification(user.id).deliver_now
    end
  end
end

