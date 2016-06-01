class User < ActiveRecord::Base
  has_one :profile
  has_many :contact_requests
  has_many :posts
  
  validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :email, presence: true, length: {minimum: 1, maximum: 50}
  validates :password, presence: true, length: {minimum: 8, maximum: 50}
  validates :password_confirmation, presence: true, length: {minimum: 8, maximum: 50}

end
