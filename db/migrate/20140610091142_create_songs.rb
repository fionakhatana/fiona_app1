class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :composer
      t.integer :movie_id #or use t.references :movie
      t.string :name
      t.timestamps
    end
  end
end
