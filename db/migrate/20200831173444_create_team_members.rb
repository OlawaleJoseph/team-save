class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.integer :team_id, null:false, foreign_key: true
      t.integer :member_id, null:false, class_name: 'User'
      t.boolean :confirmed, default: false

      t.timestamps
    end
    add_index :team_members, :team_id
    add_index :team_members, :member_id
  end
end
