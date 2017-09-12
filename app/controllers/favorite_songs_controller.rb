class FavoriteSongsController < ApplicationController
  before_action :set_song, except: [:index]

  def index
    @songs = current_user.favorite_songs
  end
  

 #  def create
 #    @user = current_user
 #    @song = Song.find(params[:song_id])
 #    @favorite_song = @user.favorite_songs.build(favorite_song_params)
 #    @favorite_song.song_id = params[:song_id]

 #    respond_to do |format|
 #      if @favorite_song.save
 #        format.html { redirect_to songs_path, notice: 'Subscription was successfully created.' }
 #        format.json { render :show, status: :created, location: @favorite_songs}
 #        format.js
 #      else
 #        format.html { render :new }
 #        format.json { render json: @favorite_song.errors, status: :unprocessable_entity }
 #        format.js { render js: @favorite_song, notice:'Unable to create Subscription' }
 #      end
 #    end
 #  end

 # def destroy
 #    @user = current_user
 #    @favorite_song = FavoriteSong.find(params[:id])
 #    @song = Song.find(params[:song_id])    
 #    @favorite_song.destroy

 #    respond_to do |format|
 #      format.html { redirect_to song_favorite_song_url, notice: 'Subscription was successfully destroyed.' }
 #      format.json { head :no_content }
 #      format.js
 #    end
 #  end

  # def create
  #   if Favorite.create(song: @song, user: current_user)
  #     redirect_to songs_path, notice: "#{@song.name} added to favorites"
  #   else
  #     redirect_to songs_path, alert: "Something went wrong!!!"
  #   end
  # end
  
  def create
    if Favorite.create(song: @song, user: current_user)
      respond_to do |format|  
        format.js
       end
    end
  end
  
  def destroy
    Favorite.where(song_id: @song.id, user_id: current_user.id).first.destroy
     respond_to do |format|
        format.js
      end
  end    
  

  # def destroy
  #   Favorite.where(song_id: @song.id, user_id: current_user.id).first.destroy
  #   redirect_to songs_path, alert: "#{@song.name} removed from favorites"
  # end
  
  private

  def favorite_song_params
    params.require(:favorite_song).permit(:song_id, :user_id)
  end
  
  def set_song
    @song = Song.find(params[:song_id] || params[:id])
  end
end