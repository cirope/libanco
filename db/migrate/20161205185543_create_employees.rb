class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :status, null: false
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :tax_id, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :employees, :status
    add_index :employees, :name
    add_index :employees, :lastname
    add_index :employees, :tax_id, unique: true
  end
end
