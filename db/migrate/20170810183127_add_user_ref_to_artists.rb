class AddUserRefToArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :artists, :user, foreign_key: true,  index: true
  end
end
