module FavoriteHelper

  def heart_class(user)
    if  Favorite.blank?
      "fa fa-heart red-heart"
    else
      "fa fa-heart grey-heart"
    end
  end

end  