class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :member, class_name: 'User'

  validates_presence_of :confirmed, default: false
end
