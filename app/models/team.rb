class Team < ApplicationRecord
  has_many :team_expenses
  has_many :expenses, through: :team_expenses
  has_many :team_members
  has_many :members, through: :team_members
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }
end
