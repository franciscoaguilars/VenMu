class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :top_genre
      t.string :category
      t.string :name
      t.string :address
      t.string :url
      t.text :description
      t.string :phone_number

      t.timestamps
    end
  end
end
