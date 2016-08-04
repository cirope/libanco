class CreateLoanTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_types do |t|
      t.string :name, null: false
      t.decimal :initial_percentage, null: false, precision: 10, scale: 2
      t.decimal :annual_percentage, null: false, precision: 10, scale: 2
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :loan_types, :name, unique: true
  end
end
