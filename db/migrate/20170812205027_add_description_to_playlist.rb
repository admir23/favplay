class AddDescriptionToPlaylist < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :description, :text
  end
end
