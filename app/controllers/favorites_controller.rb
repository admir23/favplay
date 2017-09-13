class FavoritesController < ApplicationController
  # before_action :load_song

  def index
    @songs = Favorite.all
    @favorites = Favorite.all
    @songs = current_user.favorites

  end
  

#   def create
#     @user = current_user
#     @song = Song.find(params[:song_id])
#     @favorite = @song.favorite.build(favorites_params)
#     @favorite.song_id = params[:song_id]

#     respond_to do |format|
#       if @favorite.save
#         format.html { redirect_to songs_path, notice: 'Subscription was successfully created.' }
#         format.json { render :show, status: :created, location: @favorites}
#         format.js
#       else
#         format.html { render :new }
#         format.json { render json: @favorite.errors, status: :unprocessable_entity }
#         format.js { render js: @favorite, notice:'Unable to create Subscription' }
#       end
#     end
#   end

#  def destroy
#     @user = current_user
#     @favorite = Favorite.find(params[:id])
#     @song = Song.find(params[:song_id])    
#     @favorite.destroy

#     respond_to do |format|
#       format.html { redirect_to song_favorite_url, notice: 'Subscription was successfully destroyed.' }
#       format.json { head :no_content }
#       format.js
#     end
#   end

# end

private

  def favorites_params
    params.require(:favorites).permit(:song_id, :user_id)
  end
  
   def load_song
    @song = Song.find(params[:song_id])
  end
  
end