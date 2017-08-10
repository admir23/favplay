class Artist < ApplicationRecord
	belongs_to :user

	has_many :songs, dependent: :destroy
	has_many :albums, dependent: :destroy

	validates :name, presence: true, length: {maximum: 25}
	validates :artist_image, presence: true
end	