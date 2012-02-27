class Restaurant < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
end
