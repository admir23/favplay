class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
    	t.references :user, index: true, foregin_key: true
    	t.references :song, index: true, foregin_key: true
    end
  end
end
