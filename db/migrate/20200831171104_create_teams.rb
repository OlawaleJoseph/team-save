class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :creator_id, class_name: 'User'

      t.timestamps
    end
    add_index :teams, :creator_id
  end
end
