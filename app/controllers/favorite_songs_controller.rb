class FavoriteSongsController < ApplicationController
  before_action :set_song, except: [:index]

  def index
    @songs = current_user.favorite_songs
  end
  


  # def create
  #   if Favorite.create(song: @song, user: current_user)
  #     redirect_to songs_path, notice: "#{@song.name} added to favorites"
  #   else
  #     redirect_to songs_path, alert: "Something went wrong!!!"
  #   end
  # end
  
  

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