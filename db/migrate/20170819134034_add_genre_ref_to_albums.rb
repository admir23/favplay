class AddGenreRefToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :genre, foreign_key: true
  end
end
