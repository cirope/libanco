class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :states, :name, unique: true
  end
end
