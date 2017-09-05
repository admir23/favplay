class PlaylistSongsController < ApplicationController

def create
    @song = Song.find(params[:songId])
    @playlist = Playlist.find(params[:playlist_song][:playlist_id] || params[:id])
    unless PlaylistSong.find_by(song_id: @song.id, playlist_id: @playlist.id)
    if PlaylistSong.create(song: @song, playlist: @playlist)
      redirect_to songs_path, notice: "#{@song.name} added to playlist!"
    else
      redirect_to songs_path, alert: 'Error!!!'
    end
    else
      redirect_to songs_path, notice: 'You can add song only once to playlist'
    end
  end
  
  def destroy
    @song = Song.find(params[:song_id])
    @playlist = Playlist.find(params[:playlist_id])
    PlaylistSong.where(song_id: @song.id, playlist_id: @playlist.id).first.destroy
    redirect_to playlist_path(@playlist), notice: "#{@song.name} removed from playlist"
  end
  
end