class AlbumsController < ApplicationController
	before_action :authorize
	before_action :authorize_for_admins,{ only: [:new, :edit, :destroy] }
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
			redirect_to albums_path, success: 'Album created successfully'
		else
			render :new
		end
	end


	def edit
	  unless @album.user_id == current_user.id || current_user.superadmin?
			redirect_to root_path, danger: 'Permisson denied!'
    end  
	end

	def update
		if @album.update(album_params)
			redirect_to albums_path, success: 'Album successfully updated'
		else
			render :edit
		end
	end


	def show
     @songs = @album.songs
     @artist = @album.artist
	end


	def destroy
		unless @album.user_id == current_user.id || current_user.superadmin?
      redirect_to root_path, danger: 'Permisson denied!'
    else 
	    @album.destroy
		  redirect_to albums_path, danger: 'Album deleted!'
	  end  
  end

 
	
		 
	
	private

  def album_params
		params.require(:album).permit(:name, :released, :img_url, :genre_id, :artist_id);
	end	


	def find_album
		@album = Album.find(params[:id])
	end
end		