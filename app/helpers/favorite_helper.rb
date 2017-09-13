module FavoriteHelper

  def link_to_toggle_user_favoriting(user:user, song:song)

    if song.favorited?(song_id: song.id, user_id: user.id)
      link_to('Unsubscribe', song_favorite_path(@user, song.find_favorite(user_id: @user.id, song_id: song.id), song_id: song.id), 
              method: :delete, 
              id: "unsubscribe_link_#{song.id}",
              class: "unsubscribe",
              remote: true)
    else
      link_to('Subscribe', song_favorite_path(@user, song_id: song.id), 
              method: :post, 
              id: "subscribe_link_#{song.id}", 
              class: "subscribe", 
              remote: true)
    end
  end

end