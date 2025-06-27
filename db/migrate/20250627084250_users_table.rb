class UsersTable < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.boolean :send_due_date_reminder, default: false
      t.integer :due_date_reminder_interval, default: 1
      t.time :due_date_reminder_time
      t.string :time_zone, default: "UTC"
      t.timestamps
  end

  def def down 
    drop_table :users
  end

  end
end
