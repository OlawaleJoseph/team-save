class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :username, presence: true, length: { minimum: 3, maximum: 50 },
            uniqueness: { case_sensitive: false }
end
