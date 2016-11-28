class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :status, null: false
      t.string :tax_id, null: false
      t.string :legal_name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :suppliers, :status
    add_index :suppliers, :tax_id, unique: true
    add_index :suppliers, :legal_name, unique: true
  end
end
