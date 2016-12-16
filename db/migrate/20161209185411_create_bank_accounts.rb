class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :account, null: false
      t.string :cbu, null: false
      t.references :bank, null: false, index: true

      t.timestamps
    end
    add_index :bank_accounts, :account
    add_index :bank_accounts, :cbu, unique: true
  end
end
