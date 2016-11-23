class MakeSchedulePolymorphic < ActiveRecord::Migration[5.0]
  def change
    remove_reference :schedules, :customer
    add_reference :schedules, :schedulable, polymorphic: true, index: true
  end
end
