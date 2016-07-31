class CreateEducationLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :education_levels do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :education_levels, :name, unique: true
  end
end
