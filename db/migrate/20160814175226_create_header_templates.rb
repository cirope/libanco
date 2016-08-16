class CreateHeaderTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :header_templates do |t|
      t.string :name, null: false
      t.text :content
      t.string :image
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end
