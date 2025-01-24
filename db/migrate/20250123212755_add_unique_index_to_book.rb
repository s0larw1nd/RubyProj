class AddUniqueIndexToBook < ActiveRecord::Migration[8.0]
  def change
    add_index :books, :isbn, unique: true
  end
end
