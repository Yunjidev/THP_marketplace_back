class Country < ApplicationRecord
    has_many :cities
    has_many :users
    has_many :properties
end
