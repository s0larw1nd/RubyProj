class RemoveNotNullConstraintFromGenreId < ActiveRecord::Migration[8.0]
  def change
    def change
      change_column_null :authors, :genre_id, true
    end
  end
end
