class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.boolean :cash_discount, null: false, default: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :payment_methods, :cash_discount
    add_index :payment_methods, :name, unique: true
  end
end
