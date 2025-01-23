class Author < ApplicationRecord
  has_many :books
  
  has_one_attached :photo

  validates :first_name, presence: true, length: { minimum: 2, maximum: 15 }, format: { with: /\A[А-Яа-яЁё]+\z/ }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 15 }, format: { with: /\A[А-Яа-яЁё]+\z/ }
  validates :patronymics,  presence: true, length: { minimum: 2, maximum: 15 }, format: { with: /\A[А-Яа-яЁё]+\z/ }
  validates :nationality, length: { minimum: 4, maximum: 15 }, format: { with: /\A[А-Яа-яЁё]+\z/ }

  validate :check_dates

  def display_name
    "#{first_name} #{last_name} #{patronymics}"
  end

  private

  def check_dates
    if birthdate.present? && deathdate.present? && birthdate > deathdate
      errors.add(:deathdate, "Некорректные даты рождения и смерти")
    end
  end
end
