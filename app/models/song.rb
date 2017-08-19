class Song < ApplicationRecord
	belongs_to :album
	belongs_to :genre
	belongs_to :artist
	belongs_to :user

	has_many :artists
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
	has_many :favorited, through: :favorites, source: :users

  validates_presence_of :name, :youtube_link, :length
  validates_length_of :name, maximum: 15

	
end