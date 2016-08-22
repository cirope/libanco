class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :status, null: false
      t.string :amortization_system, null: false
      t.decimal :commission_amount, null: false, precision: 10, scale: 2
      t.decimal :interest_amount, null: false, precision: 10, scale: 2
      t.decimal :tax_amount, null: false, precision: 10, scale: 2
      t.decimal :tax_perception_amount, null: false, precision: 10, scale: 2
      t.decimal :gross_income_perception_amount, null: false, precision: 10, scale: 2
      t.decimal :insurance_amount, null: false, precision: 10, scale: 2
      t.decimal :stamped_amount, null: false, precision: 10, scale: 2
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.decimal :amount_total, null: false, precision: 10, scale: 2
      t.string :payment_frequency, null: false
      t.integer :payments_count, null: false
      t.decimal :payment, null: false, precision: 10, scale: 2
      t.decimal :progress, null: false, precision: 10, scale: 2, default: 0
      t.date :expire_at
      t.datetime :canceled_at
      t.jsonb :credit_line, null: false
      t.references :customer, null: false, index: true 
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :loans, :status
    add_index :loans, :credit_line, using: :gin
  end
end
