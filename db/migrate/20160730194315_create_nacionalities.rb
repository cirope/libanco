class CreateNacionalities < ActiveRecord::Migration[5.0]
  def change
    create_table :nacionalities do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :nacionalities, :name, unique: true
  end
end
