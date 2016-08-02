class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.decimal :admission_fee, null: false, precision: 10, scale: 2
      t.decimal :monthly_fee, null: false, precision: 10, scale: 2
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :cards, :name, unique: true
  end
end
