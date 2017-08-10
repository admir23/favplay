class AddGenreReferenceToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :genre, foreign_key: true, index: true
  end
end
