class AddPhotoToAuthors < ActiveRecord::Migration[8.0]
  def change
    add_column :authors, :photo, :string
  end
end
