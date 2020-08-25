class RemoveRaginsFromGenresReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :genres_reviews, :rating, :integer
  end
end
