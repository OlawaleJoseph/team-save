class User < ApplicationRecord
  has_many :expenses, foreign_key: 'author_id'
  has_many :team_members, foreign_key: 'member_id'
  has_many :invited_teams, through: :team_members, source: :team
  has_many :my_teams, class_name: 'Team', foreign_key: 'owner_id'

  validates :first_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :username, presence: true, length: { minimum: 3, maximum: 50 },
                       uniqueness: { case_sensitive: false }
end
