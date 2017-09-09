class Song < ApplicationRecord
	belongs_to :album
	belongs_to :genre
	belongs_to :artist
	belongs_to :user

	has_many :artists
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  has_many :favorites
	has_many :favorited_by, through: :favorites, source: :users

  validates_presence_of :name, :youtube_link, :length
	validates_length_of :name, maximum: 15
	
	

  def self.search(term)
	  if term
	    where('name LIKE ?', "%#{term}%").order('id DESC')
	  else
	    all
	  end
	end

end  

	
