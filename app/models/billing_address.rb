class BillingAddress < ApplicationRecord
  validates :name, presence: true
  validates :email_address, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "format invalid"}
  validates :phone_number, presence: true, format: {with: /\d{10}/, message: "must be 10 digits"}
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: {in: UsStates::ABBREVIATIONS, message: "must be a valid U.S. state abbreviation"}
  validates :zip, presence: true, format: {with: /\d{5}/, message: "must be 5 digits"}

  encrypts :name, :email_address, :phone_number, :street_address, :city, :state, :zip, deterministic: true
end
