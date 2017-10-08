class ArtistsController < ApplicationController
	before_action :authorize
	before_action :find_artist, { only: [:show] }

	
	def index
		@artists = Artist.all.order(created_at: :desc)
	end

	def show
		@artist = Artist.find(params[:id])
		@albums = @artist.albums
		@top_songs = Song.where(artist_id: @artist.id).order('favorites_count DESC').limit(10)
  end

	

	private
  
  def artist_params
		params.require(:artist).permit(:name, :artist_image, :genre_id, :album_id, :artist_details)			
  end

  def find_artist
  	@artist = Artist.find(params[:id])
  end
end  	