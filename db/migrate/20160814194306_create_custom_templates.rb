class CreateCustomTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_templates do |t|
      t.string :kind, null: false
      t.string :name, null: false
      t.text :content, null: false
      t.references :header_template, index: true
      t.references :footer_template, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :custom_templates, :name, unique: true
  end
end
