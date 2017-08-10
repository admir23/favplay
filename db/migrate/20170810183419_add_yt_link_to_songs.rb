class AddYtLinkToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :youtube_link, :string
  end
end
