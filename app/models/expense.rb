class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than_or_equal_to: 1
end
