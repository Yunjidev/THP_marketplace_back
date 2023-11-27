class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :superficie , presence: true
  validates :num_rooms, presence: true
  validates :furnished, presence: true

end
