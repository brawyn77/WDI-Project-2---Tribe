class Post < ActiveRecord::Base
  belongs_to :user

  validates :user_from, presence: true, length: {minimum: 1, maximum: 50}
  validates :user_to, presence: true, length: {minimum: 1, maximum: 50}
  validates :message, presence: true, length: {minimum: 1, maximum: 1000}

end
