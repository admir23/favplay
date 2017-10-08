class Admin::ArtistsController < Admin::BaseController
	before_action :authorize_for_admins
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }

	def index
		@artists = Artist.all.order(created_at: :desc)
	end

	def new
		@artist = Artist.new
	end
	
	def create
		@artist = Artist.new(artist_params)
		@artist.user_id = current_user.id

		if @artist.save
			redirect_to admin_artists_path, success: 'Artist created successfully!'
		else
			render :new
    end
  end
  
  def edit
	  unless @artist.user_id == current_user.id || current_user.superadmin?
			redirect_to root_path, danger: 'Permisson denied!'
	  end 
  end

  def update
  	if @artist.update(artist_params)
			redirect_to admin_artists_path, success: 'Artist successfully updated!' 
		else
			render :edit
		end
	end

	def show
		@artist = Artist.find(params[:id])
		@albums = @artist.albums
		@top_songs = Song.where(artist_id: @artist.id).order('favorites_count DESC').limit(10)
  end

	def destroy
		unless @artist.user_id == current_user.id || current_user.superadmin?
			redirect_to root_path, danger: 'Permisson denied!'
    else 
			@artist.destroy
			redirect_to admin_artists_path, danger: 'Artist deleted!'
		end	
	end

	private
  
  def artist_params
		params.require(:artist).permit(:name, :artist_image, :genre_id, :album_id, :artist_details)			
  end

  def find_artist
  	@artist = Artist.find(params[:id])
  end
end  	