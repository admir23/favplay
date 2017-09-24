class Genre < ApplicationRecord
	belongs_to :user

	has_many :songs, dependent: :destroy
	has_many :albums, dependent: :destroy
	has_many :artists, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 25}
  
end