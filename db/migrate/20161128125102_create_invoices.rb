class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.date :date, null: false
      t.string :number, null: false
      t.decimal :subtotal, null: false, precision: 10, scale: 2
      t.decimal :tax_amount, null: false, precision: 10, scale: 2
      t.decimal :tax_perception_amount, null: false, precision: 10, scale: 2
      t.decimal :gross_income_perception_amount, null: false, precision: 10, scale: 2
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.text :detail
      t.references :invoice_type, null: false, index: true
      t.references :tax_condition, null: false, index: true
      t.references :expense_type, null: false, index: true
      t.references :payment_method, null: false, index: true
      t.references :supplier, null: false, index: true
      t.references :user, null: false, index: true
      t.references :cash, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :invoices, :date
    add_index :invoices, :number
  end
end
