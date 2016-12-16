class CreateInvoiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_types do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :invoice_types, :name, unique: true
  end
end
