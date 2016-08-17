class CreateHeaderTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :header_templates do |t|
      t.string :name, null: false
      t.string :image
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :header_templates, :name, unique: true
  end
end
