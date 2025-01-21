class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymics
      t.date :birthdate
      t.date :deathdate
      t.string :nationality
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
