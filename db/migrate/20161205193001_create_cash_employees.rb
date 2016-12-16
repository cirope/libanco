class CreateCashEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_employees do |t|
      t.date :period, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.references :employee, null: false, index: true
      t.references :user, null: false, index: true
      t.references :cash, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :cash_employees, :period
  end
end
