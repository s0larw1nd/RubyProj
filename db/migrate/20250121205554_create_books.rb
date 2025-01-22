class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.integer :publication_year
      t.integer :isbn

      t.timestamps
    end
  end
end
