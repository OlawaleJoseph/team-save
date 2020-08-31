class CreateTeamExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :team_expenses do |t|
      t.integer :team_id, null:false, foreign_key: true
      t.integer :expense_id, null:false, foreign_key: true

      t.timestamps
    end

    add_index :team_expenses, :team_id
    add_index :team_expenses, :expense_id
  end
end
