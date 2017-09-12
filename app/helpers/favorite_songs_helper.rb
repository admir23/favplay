module FavoriteSongsHelper

  def link_to_toggle_user_favoriting(user:user, song:song)

  if current_user.favorite_songs.exists?(song)
      link_to('Unsubscribe', favorite_song_path(song_id: song), 
              method: :delete, 
              id: "unsubscribe_link_#{song.id}",
              class: "unsubscribe",
              remote: true)
    else
      link_to('Subscribe', favorite_songs_path(song), 
              method: :post, 
              id: "subscribe_link_#{song.id}", 
              class: "subscribe", 
              remote: true)
    end
  end

end