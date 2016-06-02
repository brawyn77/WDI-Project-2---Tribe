class User < ActiveRecord::Base
  # Set up relationships to table associated with user table
  has_one :profile
  has_many :contact_requests
  has_many :posts

  # Links in bcrypt to manage password actions
  has_secure_password

  # Validation for the user table fields
  validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :email, presence: true, length: {minimum: 1, maximum: 50}

end
