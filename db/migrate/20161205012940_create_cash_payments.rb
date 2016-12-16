class CreateCashPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_payments do |t|
      t.references :customer, null: false, index: true
      t.references :payment, null: false, index: true
      t.references :user, null: false, index: true
      t.references :cash, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
