module FavoriteHelper

  def heart_class(user)
    if  Favorite.blank?
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