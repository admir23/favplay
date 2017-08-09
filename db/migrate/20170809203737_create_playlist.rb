class CreatePlaylist < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name, null:false
    end
  end
end
