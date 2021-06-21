class CreateCategorisations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorisations do |t|
      t.references :category, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end

    add_index :categorisations, [:category_id, :movie_id], unique: true
  end
end
