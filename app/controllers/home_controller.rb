class HomeController < ApplicationController
	def index
		@latest_albums = Album.order('created_at DESC').last(5)
		@top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id").select("favorites.*,songs.name as name, songs.artist_id as artist_id").group(:song_id).order('COUNT(songs.id) DESC')
  .limit(10)
	end
end		