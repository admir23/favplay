class Song < ApplicationRecord
	belongs_to :album
	belongs_to :genre
	belongs_to :artist
	belongs_to :user

	has_many :artists
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

 #  has_many :favorites
	# has_many :favorited_by, through: :favorites, source: :users

  has_many :favorites
  has_many :users, through: :favorites

  validates_presence_of :name, :youtube_link, :length
	validates_length_of :name, maximum: 55

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%").order('id DESC')
    else
      all
    end
  end


	def update_likes(user)
    user_liked?(user) ? unlike(user) : like(user)
  end

  def likes_message(user)
    if !user_liked?(user)
      "<strong>#{self.favorites.count} people</strong> like this song".html_safe
    else
      "<strong>You</strong> and <strong>#{self.favorites.count - 1} other people</strong> like this song".html_safe
    end
  end

  def heart_class(user)
    if user_liked?(user)
      "fa fa-heart red-heart"
    else
      "fa fa-heart grey-heart"
    end
  end

  private

  def user_liked?(user)
    self.favorites.where(user: user).any?
  end

  def like(user)
    self.favorites.create(user_id: user.id)
  end

  def unlike(user)
    self.favorites.find_by(user_id: user.id).destroy
  end
end

	
	

  

	
