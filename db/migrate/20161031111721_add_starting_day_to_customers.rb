class AddStartingDayToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :starting_day, :integer
  end
end
