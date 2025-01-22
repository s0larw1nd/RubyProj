class Author < ApplicationRecord
  has_many :genre
  has_one_attached :photo

  def display_name
    "#{first_name} #{last_name} #{patronymics}"
  end
end
