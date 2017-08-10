class AddArtistReferenceToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :artist, foreign_key: true, index: true
  end
end
