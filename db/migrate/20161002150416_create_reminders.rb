class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.datetime :remind_at, null: false
      t.string :type, null: false
      t.boolean :notified, null: false, default: false
      t.boolean :scheduled, null: false, default: false
      t.references :schedule, null: false, index: true
      t.references :account, null: false, index: true

      t.timestamps
    end
  end
end
