class CreateTeamExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :team_expenses do |t|

      t.timestamps
    end
  end
end
