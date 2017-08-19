class Album  < ApplicationRecord
	belongs_to :genre
	belongs_to :artist
	


	has_many :tracks, dependent: :destroy

	validates :name, presence: true, length: {maximum: 15}
	validates :released, presence: true, numericality: true
	validates :img_url, presence: true

end	