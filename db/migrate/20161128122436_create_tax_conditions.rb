class CreateTaxConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :tax_conditions do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :tax_conditions, :name, unique: true
  end
end
