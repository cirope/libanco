class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :identification_type, null: false
      t.string :identification, null: false
      t.string :phone, null: false
      t.references :relationship, null: false, index: true
      t.references :customer, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :references, :identification, unique: true
  end
end
