class AlterExpenseColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :owner_id, :integer
  end
end
