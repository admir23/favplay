class AlbumsController < ApplicationController
	before_action :authorize
	before_action :authorize_for_superadmins, { only: [:edit, :destroy] }
	before_action :authorize_for_admins, { only: [:new] }
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }

	def index
		@albums = Album.paginate(:page => params[:page], :per_page => 4).order(created_at: :desc)
  end
	
	def new
		@album = Album.new
	end
	
	def create
		@album = Album.new(album_params)
		@album.user_id = current_user.id
    
    if @album.save
			flash[:notice] = 'Album created successfully'
			redirect_to albums_path
		else
			render :new
		end
	end


	def edit
	end

	def update
		if @album.update(album_params)
			flash[:notice] = 'Album successfully updated'
			redirect_to albums_path
		else
			render :edit
		end
	end


	def show
     @songs = @album.songs
     @artist = @album.artist
	end

	def destroy
		@album.destroy
		flash[:notice] = 'Album deleted'
	  redirect_to albums_path
	end
	
	private

  def album_params
		params.require(:album).permit(:name, :released, :img_url, :genre_id, :artist_id);
	end	


	def find_album
		@album = Album.find(params[:id])
	end
end		