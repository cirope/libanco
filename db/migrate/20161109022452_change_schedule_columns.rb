class ChangeScheduleColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedules, :schedulable_type
    remove_column :schedules, :schedulable_id
    add_reference :schedules, :customer, index: true
  end
end
