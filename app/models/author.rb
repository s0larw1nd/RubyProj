class Author < ApplicationRecord
  has_many :genre
  has_one_attached :photo
end
