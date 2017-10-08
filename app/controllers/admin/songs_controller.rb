class Admin::SongsController < Admin::BaseController
	before_action :authorize_for_admins
	before_action :find_song, {only: [:edit, :update, :show, :destroy, :favorite]}

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
	 		redirect_to admin_songs_path, success:'Song created successfully'
	 	else
	 	render :new
	 end
	end
	 	

	def edit
	 	unless @song.user_id == current_user.id || current_user.superadmin?
	 		redirect_to root_path, danger: 'Permisson denied!'
	 	end
	end
	 
	def update
	 	if @song.update(songs_params)
	 		redirect_to admin_songs_path, success:'Song updated successfully'
	 	else
	 		render :edit
	 	end
	end				

	 
	def show
	end


	def destroy
	 	unless @song.user_id == current_user.id || current_user.superadmin?
	 		redirect_to root_path, danger: 'Permisson denied!'
	 	else	
		 	@song.destroy
		 	redirect_to admin_songs_path, danger:'Song deleted successfully'
		end 	
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