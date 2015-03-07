class Category < ActiveRecord::Base

  validates :name, uniqueness: true
  validates :color, :name, :icon, presence: true

end
