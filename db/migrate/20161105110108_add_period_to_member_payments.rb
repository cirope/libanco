class AddPeriodToMemberPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :member_payments, :period, :date, null: false
    add_column :member_payments, :comment, :text
    add_index :member_payments, :period
    add_index :customers, :starting_day
    add_index :customers, :created_at
  end
end
