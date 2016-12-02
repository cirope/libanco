class CreateCashMemberPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_member_payments do |t|
      t.references :customer, null: false, index: true
      t.references :member_payment, null: false, index: true
      t.references :user, null: false, index: true
      t.references :cash, null: false, index: true
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
