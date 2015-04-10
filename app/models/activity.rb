class Activity < ActiveRecord::Base

  include ActivityConcern
  include Filterable

  has_many :participations
  has_many :users, through: :participations
  has_many :comments

  belongs_to :creator, class_name: User
  belongs_to :category

  delegate :color, to: :category, allow_nil: true
  delegate :icon, to: :category, allow_nil: true

  validates :creator, :name, :description, :category, presence: true
  validates :urgent, inclusion: { in: [true, false] }
  validates :capacity, numericality: true

  validates :name, uniqueness: true

  scope :name_like, lambda{|l|  where('lower(name) LIKE :l or lower(description) LIKE :l', l: "%#{l}%")}
  scope :urgent, lambda { |u| where(urgent: true) }
  scope :category, lambda {|c| joins(:category).where(categories: { name: c})}
  scope :creator, lambda {|c| joins(:creator).where(creator_id: c)}

  default_scope { includes(:creator, :category, { users: :participations } ).order(id: :desc) }


  def full?
    capacity > 0 && capacity == users.count
  end

end

