class AddPdfToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :pdf_file, :string
  end
end
