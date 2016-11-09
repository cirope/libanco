class CreateMemberPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :member_payments do |t|
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.date :paid_at
      t.date :period, null: false
      t.date :expire_at, null: false
      t.text :comment
      t.references :customer, null: false, index: true

      t.timestamps
    end
    add_index :member_payments, :period
    add_index :member_payments, :paid_at
    add_index :member_payments, :expire_at
  end
end
