class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :number, null: false
      t.decimal :capital, null: false, precision: 12, scale: 4
      t.decimal :interest, null: false, precision: 12, scale: 4
      t.decimal :extra_interest, null: false, precision: 12, scale: 4, default: 0
      t.decimal :tax, null: false, precision: 12, scale: 4
      t.decimal :tax_interest, null: false, precision: 12, scale: 4, default: 0
      t.decimal :tax_perception, null: false, precision: 12, scale: 4
      t.decimal :gross_income_perception, null: false, precision: 12, scale: 4
      t.decimal :insurance, null: false, precision: 12, scale: 4
      t.decimal :balance, null: false, precision: 12, scale: 4
      t.decimal :amount, null: false, precision: 12, scale: 4
      t.date :expire_at, null: false
      t.datetime :paid_at
      t.references :loan, null: false, index: true

      t.timestamps
    end
  end
end
