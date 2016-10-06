class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.text :description, null: false
      t.datetime :scheduled_at, null: false
      t.boolean :done, null: false, default: false
      t.boolean :remind_me, null: false, default: false
      t.references :user, null: false, index: true
      t.references :schedulable, polymorphic: true, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :schedules, :scheduled_at
  end
end
