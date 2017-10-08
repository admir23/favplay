class SongsController < ApplicationController
	before_action :authorize
	before_action :find_song, {only: [:show, :favorite]}

	def index
	 	@songs = Song.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  	@latest_albums = Album.order('created_at DESC').last(5)
	end
	
	 
  def show
	end

  def favorite
    @song = Song.find(params[:id])
    @song.update_favorites(current_user)
    @current_user = current_user

    respond_to do |format|
    	if @current_user.favorites.exists?	
	    	format.js { flash[:notice] = "#{@song.name} added to favorites!"}
	      format.json { render json: {message: message} }
	      format.html { redirect_to root_path }
      else
	      format.js { flash[:notice] = "#{@song.name} removed from favorites!"}
	      format.json { render json: {message: message} }
	      format.html { redirect_to root_path }
	    end
	  end  
  end



	private

	def songs_params
		params.require(:song).permit(:name, :length, :youtube_link, :artist_id, :album_id, :genre_id)	
	end	

	def find_song
		@song = Song.find(params[:id])
	end	

end	 						