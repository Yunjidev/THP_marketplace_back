class Property < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :superficie, presence: true
  validates :num_rooms, presence: true
  validates :furnished, inclusion: { in: [true, false] }
  attribute :superficie, :integer

  def num_rooms
    self[:num_rooms] || 0
  end

  def category=(value)
    self[:category] = value
  end
end

