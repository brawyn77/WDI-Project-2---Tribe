class User < ActiveRecord::Base
  has_one :profile
  has_many :contact_requests
  has_many :posts
  has_secure_password

  validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :email, presence: true, length: {minimum: 1, maximum: 50}

end
