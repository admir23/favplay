class Songs::FavoritesController < ApplicationController

  before_action :load_song

  def update
    @song.favorite!
  end

  def destroy
    @song.unfavorite!
  end

  private

  def load_song
    @song = Song.find(params[:song_id])
  end

end