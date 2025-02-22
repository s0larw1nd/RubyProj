class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  has_one_attached :pdf_file
  has_one_attached :cover

  validates :isbn, uniqueness: { message: "Поле должно быть уникально" }
end
