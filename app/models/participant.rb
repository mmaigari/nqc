class Participant < ApplicationRecord
  before_save :set_full_name
  before_validation :set_default_ticket_type

  # Validations
  validates :first_name, presence: true
  validates :surname, presence: true
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, 
    presence: true, 
    uniqueness: { message: "has already been registered" },
    format: { with: /\A\d{11}\z/, message: "must be 11 digits" }
  validates :account_number, length: { maximum: 10 }, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  validates :year_of_musabaqa, presence: true, numericality: { only_integer: true }, length: { is: 4 }
  validates :phone_number, uniqueness: { 
    scope: [:first_name, :surname],
    message: 'This combination of name and phone number is already registered' 
  }
  
  # Optional: Add custom validation method
  validate :unique_participant_check

  private

  def unique_participant_check
    existing_participant = Participant.where(
      "lower(first_name) = ? AND lower(surname) = ? AND phone_number = ?",
      first_name.downcase,
      surname.downcase,
      phone_number
    ).where.not(id: id).exists?

    if existing_participant
      errors.add(:base, 'A participant with this name and phone number combination already exists')
    end
  end

  def set_full_name
    self.full_name = [first_name, middle_name, surname].compact.reject(&:blank?).join(' ')
  end

  def set_default_ticket_type
    self.ticket_type ||= 'Hafiz Quran'
  end
end
