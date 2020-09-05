class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :team_expenses
  has_many :teams, through: :team_expenses

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than_or_equal_to: 1

  scope :desc, -> { includes(:author).order('created_at DESC') }

  scope :desc_team, -> { desc.select { |expense| expense.teams.exists? } }

  scope :desc_no_team, -> { desc.reject { |expense| expense.teams.exists? } }
end
