class AddOwnerIdColumnToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :owner_id, :integer
    
    add_index :teams, :owner_id
  end
end
