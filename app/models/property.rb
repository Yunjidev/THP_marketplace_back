class Property < ApplicationRecord
  after_create :set_country_name, :set_city_name
  belongs_to :user
  belongs_to :city
  belongs_to :country
  
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :superficie, presence: true
  validates :num_rooms, presence: true
  validates :furnished, inclusion: { in: [true, false] }
  attribute :superficie, :integer

  def set_country_name
    self.update!(country_name: country.name)
  end

  def set_city_name
    self.update!(city_name: city.name)
  end

  def num_rooms
    self[:num_rooms] || 0
  end

  def category=(value)
    self[:category] = value
  end
end


