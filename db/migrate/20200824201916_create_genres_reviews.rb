class CreateGenresReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :genres_reviews do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
