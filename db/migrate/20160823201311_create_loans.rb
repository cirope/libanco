class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :status, null: false
      t.string :amortization_system, null: false
      t.decimal :commission_amount, null: false, precision: 12, scale: 4
      t.decimal :interest_amount, null: false, precision: 12, scale: 4
      t.decimal :tax_amount, null: false, precision: 12, scale: 4
      t.decimal :tax_perception_amount, null: false, precision: 12, scale: 4
      t.decimal :gross_income_perception_amount, null: false, precision: 12, scale: 4
      t.decimal :insurance_amount, null: false, precision: 12, scale: 4
      t.decimal :stamped_amount, null: false, precision: 12, scale: 4
      t.decimal :amount, null: false, precision: 12, scale: 4
      t.decimal :amount_total, null: false, precision: 12, scale: 4
      t.integer :payment_frequency, null: false
      t.integer :payments_count, null: false
      t.integer :first_payment_days, null: false
      t.decimal :payment, null: false, precision: 12, scale: 4
      t.decimal :progress, null: false, precision: 5, scale: 2, default: 0
      t.date :expire_at, null: false
      t.datetime :canceled_at
      t.jsonb :credit_line_data, null: false
      t.references :credit_line, null: false, index: true 
      t.references :customer, null: false, index: true 
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :loans, :status
    add_index :loans, :credit_line_data, using: :gin
  end
end
