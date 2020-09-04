class User < ApplicationRecord
  has_many :expenses, foreign_key: 'author_id'
  has_many :team_members, foreign_key: 'member_id'
  has_many :invited_teams, through: :team_members, source: :team
  has_many :my_teams, class_name: 'Team', foreign_key: 'creator_id'
  has_one_attached :avatar

  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :username, presence: true, length: { minimum: 3, maximum: 50 },
                       uniqueness: { case_sensitive: false }

  def total_expenses
    expenses.map(&:amount).inject(:+)
  end

  def all_teams
    [].concat(invited_teams, my_teams)
  end

  def invitations
    team_members.includes(:team, :member).where(confirmed: false)
  end
end
