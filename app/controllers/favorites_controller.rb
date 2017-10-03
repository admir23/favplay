class FavoritesController < ApplicationController
  before_action :authorize

  def index
    @songs = current_user.favorites
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    @current_user = current_user
     if @favorite.destroy
      redirect_to favorites_path, danger:"#{@favorite.song.name} removed from favorites"
     end 
  end  

  
  private

  def favorites_params
    params.require(:favorites).permit(:song_id, :user_id)
  end
  
end