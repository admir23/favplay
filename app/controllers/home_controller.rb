class HomeController < ApplicationController
	def index
		@songs = current_user.songs.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
		@latest_albums = Album.order('created_at DESC').last(5)
		@top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id")
		                     .select("favorites.id,songs.name as name, songs.artist_id as artist_id")
		                     .group(:song_id).order('COUNT(songs.id) DESC')
                         .limit(10)
	end
end		