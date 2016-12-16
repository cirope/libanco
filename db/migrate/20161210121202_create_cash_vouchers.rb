class CreateCashVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_vouchers do |t|
      t.string :kind, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.text :comment, null: false
      t.boolean :annulled, null: false, default: false
      t.references :owner, polymorphic: true, null: false, index: true
      t.references :user, null: false, index: true
      t.references :cash, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :cash_vouchers, :kind
  end
end
