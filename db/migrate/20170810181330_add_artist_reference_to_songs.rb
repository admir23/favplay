class AddArtistReferenceToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :artist, foreign_key: true, index: true
  end
end
