class Playlist < ApplicationRecord
  has_one :user
  
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs

  validates :name, presence: true, length: {maximum: 15}
  validates :description, presence: true 
end