class RemovePdfFileFromBooks < ActiveRecord::Migration[8.0]
  def change
    remove_column :books, :pdf_file, :string
  end
end
