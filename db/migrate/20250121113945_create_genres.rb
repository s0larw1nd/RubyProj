class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.text :description

      t.timestamps
    end
  end
end
