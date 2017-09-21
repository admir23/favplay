class ArtistsController < ApplicationController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end
	
	def create
		@artist = Artist.new(artist_params)
		@artist.user_id = current_user.id

		if @artist.save
			flash[:notice] = 'Artist created successfully'
			redirect_to artists_path
		else
			render :new
    end
  end
  
  def edit
  end

  def update
  	if @artist.update(artist_params)
			flash[:notice] = 'Artist successfully updated' 
			redirect_to artists_path
		else
			render :edit
		end
	end

	def show
		@artist = Artist.find(params[:id])
		@albums = @artist.albums
		@top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id")
		 	                     .select("favorites.*,songs.name as name, songs.artist_id as artist_id")
		 	                     .group(:song_id).order('COUNT(songs.id) DESC')
	                         .limit(10)
  	@top_songs = Song.where(artist_id: @artist.id)
  end

	def destroy
		@artist.destroy
		flash[:notice] = 'Artist deleted'
		redirect_to artists_path
	end

	private
  
  def artist_params
		params.require(:artist).permit(:name, :artist_image, :genre_id, :album_id, :artist_details)			
  end

  def find_artist
  	@artist = Artist.find(params[:id])
  end
end  	