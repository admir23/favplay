class HomeController < ApplicationController

	include SongHelper
	
	def index
		@songs = Song.search(params[:term]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
		@latest_albums = Album.order('created_at DESC').first(5)
		@top_songs = Song.order('favorites_count DESC').limit(5)
	end

	private

	def home_params
		params.require(:home).permit(:term)
	end
	

end		