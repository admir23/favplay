class AddUserRefToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :user, foreign_key: true, index: true
  end
end
