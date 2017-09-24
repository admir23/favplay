class AddFavoritesCountToSongs < ActiveRecord::Migration[5.1]
  def change
  	add_column :songs, :favorites_count, :integer, default: 0
  end
end
