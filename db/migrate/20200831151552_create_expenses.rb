class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :author_id, class_name: 'User'
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end
    add_index :expenses, :author_id
  end
end
