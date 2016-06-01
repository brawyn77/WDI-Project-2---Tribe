class Profile < ActiveRecord::Base
  belongs_to :user
  validates :username, presence: true, length: {minimum: 8, maximum: 50}
  validates :address, presence: true, length: {minimum: 8, maximum: 50}
  validates :suburb, presence: true, length: {minimum: 2, maximum: 30}
  validates :postcode, presence: true, length: {minimum: 4, maximum: 4}
  validates :search_radius, presence: true, length: {minimum: 1, maximum: 4}
  validates :age, presence: true, length: {maximum: 3}
  validates :sex, presence: true, length: {maximum: 4}
  validates :interests, presence: true, length: {minimum: 1, maximum:100}
end
