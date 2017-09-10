class SongsController < ApplicationController
	before_action :find_song, {only: [:edit, :update, :show, :destroy, :vote]}

	def index
	 	@songs = Song.all
	 	@songs = Song.search(params[:term]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
	 	@top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id").select("favorites.*,songs.name as name, songs.artist_id as artist_id").group(:song_id).order('COUNT(songs.id) DESC')
  .limit(10)
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

	 def vote
		if !current_user.liked? @song
		@song.liked_by current_user
		elsif current_user.liked? @song
		@song.unliked_by current_user
		end	
	end

	 private

	 def songs_params
	 	params.require(:song).permit(:name, :length, :youtube_link, :artist_id, :album_id, :genre_id, :term);	
	 end
	 
	 def find_song
	  @song = Song.find(params[:id])
 	 end 	

end	 						