class ContactRequest < ActiveRecord::Base
  belongs_to :user

  validates :from, presence: true, length: {minimum: 1, maximum: 50}
  validates :to, presence: true, length: {minimum: 1, maximum: 50}
  validates :request, presence: true, length: {minimum: 1, maximum: 100}
  validates :permission, presence: true
end
