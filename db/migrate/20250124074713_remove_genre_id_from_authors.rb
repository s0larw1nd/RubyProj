class RemoveGenreIdFromAuthors < ActiveRecord::Migration[8.0]
  def change
    remove_column :authors, :genre_id, :integer
  end
end
