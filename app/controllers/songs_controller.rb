class SongsController < ApplicationController
	before_action :authorize
	before_action :authorize_for_superadmins, { only: [:edit, :destroy] }
	before_action :authorize_for_admins, { only: [:new] }
	before_action :find_song, {only: [:edit, :update, :show, :favorite]}

	def index
	 	@songs = Song.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  	@latest_albums = Album.order('created_at DESC').last(5)
	end
	
	 
	 def new
	 	@song = Song.new
	 end
	 
	 def create
	 	@song = Song.new(songs_params)
	 	@song.user_id = current_user.id
		 	if @song.save
		 		flash[:notice] = 'Song created successfully'
		 		redirect_to songs_path
		 	else
		 		render :new
		 	end
		end
	 	

	 def edit
	 end
	 
	 def update
	 	if @song.update(songs_params)
	 		flash[:notice] = 'Song successfully updated'
	 		redirect_to songs_path
	 	else
	 		render :edit
	 	end
	end				

	 def show
	 end

	 def destroy
	 	@song.destroy
	 	flash[:notice] = 'Song deleted successfully'
	 	redirect_to songs_path
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