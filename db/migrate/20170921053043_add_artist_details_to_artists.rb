class AddArtistDetailsToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :artist_details, :string
  end
end
