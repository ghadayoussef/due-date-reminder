class TicketsTable < ActiveRecord::Migration[8.0]
  def up
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :assigned_user, foreign_key: { to_table: :users }
      t.date :due_date
      t.integer :status_id
      t.integer :progress
      t.timestamps
    end
  end

  def def down 
    drop_table :tickets
  end
end
