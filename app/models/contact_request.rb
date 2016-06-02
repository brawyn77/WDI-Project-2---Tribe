class ContactRequest < ActiveRecord::Base
  # Set up relationship to user table
  belongs_to :user

  # Validation for the contact_request table fields
  validates :from, presence: true, length: {minimum: 1, maximum: 50}
  validates :to, presence: true, length: {minimum: 1, maximum: 50}
  validates :request, presence: true, length: {minimum: 1, maximum: 100}
  validates :permission, presence: true
end
