class CreateWorkgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :workgroups do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :workgroups, :name, unique: true
  end
end
