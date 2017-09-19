class FavoritesController < ApplicationController

  def index
    @songs = current_user.favorites
    @top_songs = Favorite.joins("LEFT OUTER JOIN songs ON favorites.song_id = songs.id").select("favorites.*,songs.name as name, songs.artist_id as artist_id").group(:song_id).order('COUNT(songs.id) DESC')
  .limit(10)
  end

  
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

  
  private

  def favorites_params
    params.require(:favorites).permit(:song_id, :user_id)
  end
  
end