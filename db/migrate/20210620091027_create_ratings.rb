class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :rating, null: false

      t.timestamps
    end

    add_index :ratings, [:user_id, :movie_id], unique: true
  end
end
