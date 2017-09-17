class FavoritesController < ApplicationController

  def index
    @songs = current_user.favorites
    @top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id").select("favorites.*,songs.name as name, songs.artist_id as artist_id").group(:song_id).order('COUNT(songs.id) DESC')
  .limit(10)
  end


  # def unlike
  #   @song = Song.find(params[:id])
  #   @song.unlike(current_user)

  #   respond_to do |format|
  #     format.json { render json: {message: message} }
  #     format.html { redirect_to root_path }
  #   end
  # end

  
private

  def favorites_params
    params.require(:favorites).permit(:song_id, :user_id)
  end
  
end