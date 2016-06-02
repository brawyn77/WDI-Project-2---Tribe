class Post < ActiveRecord::Base
  # Set up relationship to user table
  belongs_to :user

  # Validation for the post table fields
  validates :user_from, presence: true, length: {minimum: 1, maximum: 50}
  validates :user_to, presence: true, length: {minimum: 1, maximum: 50}
  validates :message, presence: true, length: {minimum: 1, maximum: 1000}

end
