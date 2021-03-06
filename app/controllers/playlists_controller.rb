class PlaylistsController < ApplicationController
  before_action :authorize
	before_action :find_playlist, { only: [:edit, :update, :show, :destroy] }


	def index
		@playlists = current_user.playlists
		@playlist = Playlist.new
	end
	
	def new
		@playlist = Playlist.new
	end	


	def create
		@playlist = Playlist.new(playlist_params)
		@playlist.user_id = current_user.id
			respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, success: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
        format.js { flash[:notice] = 'Playlist was created successfully!' }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, success: 'Playlist successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
        format.js { flash[:notice] = 'Playlist was updated successfully!' } 
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end


  def show
  end


  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_path, danger: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash[:alert] = 'Playlist was successfully destroyed.'}
    end
  end
 				
	private

	def playlist_params
		params.require(:playlist).permit(:name, :description, :user_id);
	end

	def find_playlist
		@playlist = Playlist.find(params[:id])
	end
end		