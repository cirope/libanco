class CreateCustomTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_templates do |t|
      t.string :name, null: false
      t.references :header_template, index: true
      t.references :footer_template, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
