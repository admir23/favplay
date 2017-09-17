class Favorite < ApplicationRecord

	include FavoriteHelper

  belongs_to :user
  belongs_to :song
  accepts_nested_attributes_for :song

end

