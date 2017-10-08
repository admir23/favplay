class AlbumsController < ApplicationController
	before_action :authorize
	before_action :find_album, { only: [:show] }

	def index
		@albums = Album.paginate(:page => params[:page], :per_page => 4).order(created_at: :desc)
  end
	
	def show
     @songs = @album.songs
     @artist = @album.artist
	end


  private

  def album_params
		params.require(:album).permit(:name, :released, :img_url, :genre_id, :artist_id);
	end	


	def find_album
		@album = Album.find(params[:id])
	end
end		