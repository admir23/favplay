class CreatePlaylistSong < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_songs do |t|
      t.references :playlist,  index: true, foreign_key: true
      t.references :song, index: true,  foreign_key: true 

      t.timestamps
    end
  end
end
