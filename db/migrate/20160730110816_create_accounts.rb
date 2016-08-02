class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :accounts, :name, unique: true
    add_index :accounts, :subdomain, unique: true
  end
end
