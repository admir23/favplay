class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :length

      t.timestamps
    end
  end
end
