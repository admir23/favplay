	module SongHelper

  def update_favorites(user)
    user_favorited?(user) ? unfavorite(user) : favorite(user)
  end

  def favorites_message(user)
    if !user_favorited?(user)
      "<strong>#{self.favorites.count} people</strong> favorited this song".html_safe
    else
      "<strong>You</strong> and <strong>#{self.favorites.count - 1} other people</strong> favorited this song".html_safe
    end
  end

  def heart_class(user)
    if user_favorited?(user)
      "fa fa-heart red-heart"
    else
      "fa fa-heart grey-heart"
    end
  end

  private

  def user_favorited?(user)
    self.favorites.where(user: user).any?
  end

  def favorite(user)
    self.favorites.create(user_id: user.id)
  end

  def unfavorite(user)
    self.favorites.find_by(user_id: user.id).destroy
  end
end  