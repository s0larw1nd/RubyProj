class Author < ApplicationRecord
  has_many :books

  has_one_attached :photo

  validates :first_name, :last_name, :patronymics,
  presence: { message: "Поле обязательно для заполнения" },
  length: {
    minimum: 2,
    maximum: 15,
    too_short: "Поле должно содержать минимум %{count} символа",
    too_long: "Поле должно содержать максимум %{count} символов"
  },
  format: {
    with: /\A[А-Яа-яЁё]+\z/,
    message: "Поле может содержать только русские буквы"
  }
  validates :nationality,
  length: {
    minimum: 4,
    maximum: 15,
    too_short: "Поле должно содержать минимум %{count} символа",
    too_long: "Поле должно содержать максимум %{count} символов"
  },
  format: {
    with: /\A[А-Яа-яЁё]+\z/,
    message: "Поле может содержать только русские буквы"
  }

  validate :check_dates

  def display_name
    "#{first_name} #{last_name} #{patronymics}"
  end

  private

  def check_dates
    if birthdate.present? && deathdate.present? && birthdate > deathdate
      errors.add(:deathdate, "Некорректные даты рождения и смерти")
    elsif birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, "Некорректная дата рождения")
    elsif deathdate.present? && deathdate > Date.today
      errors.add(:deathdate, "Некорректная дата смерти")
    end
  end
end
