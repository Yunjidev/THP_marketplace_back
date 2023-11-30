class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
	       jwt_revocation_strategy: JwtDenylist

  has_many :properties, foreign_key: :user_id
  has_many :countries, through: :properties
  has_many :cities, through: :countries
end
