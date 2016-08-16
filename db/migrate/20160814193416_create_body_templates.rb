class CreateBodyTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :body_templates do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :body_templates, :name, unique: true
  end
end
