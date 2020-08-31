class TeamExpense < ApplicationRecord
  belongs_to :team
  belongs_to :expense
end
