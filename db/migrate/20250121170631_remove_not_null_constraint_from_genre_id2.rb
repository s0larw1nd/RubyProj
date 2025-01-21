class RemoveNotNullConstraintFromGenreId2 < ActiveRecord::Migration[8.0]
  def change
    change_column_null :authors, :genre, true
  end
end
