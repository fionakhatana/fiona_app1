class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.integer :user_id
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps
    end
  end
end
