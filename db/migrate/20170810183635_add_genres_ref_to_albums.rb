class AddGenresRefToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :genres, foreign_key: true
  end
end
