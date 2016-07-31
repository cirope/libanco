class CreateMaritalStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :marital_statuses do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :marital_statuses, :name, unique: true
  end
end
