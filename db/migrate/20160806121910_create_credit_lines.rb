class CreateCreditLines < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_lines do |t|
      t.string :name, null: false
      t.decimal :commission, null: false, precision: 10, scale: 2
      t.decimal :commission_max, null: false, precision: 10, scale: 2
      t.decimal :interest, null: false, precision: 10, scale: 2
      t.decimal :tax, null: false, precision: 10, scale: 2
      t.decimal :tax_perception, null: false, precision: 10, scale: 2
      t.decimal :gross_income_perception, null: false, precision: 10, scale: 2
      t.decimal :gross_income_perception_min, null: false, precision: 10, scale: 2
      t.decimal :insurance, null: false, precision: 10, scale: 2
      t.decimal :stamped, null: false, precision: 10, scale: 2
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :credit_lines, :name, unique: true
  end
end
