class RemovePhotoFromAuthors < ActiveRecord::Migration[8.0]
  def change
    remove_column :authors, :photo, :string
  end
end
