class CreateCustomBodyTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_body_templates do |t|
      t.references :custom_template, null: false
      t.references :body_template, null: false

      t.timestamps
    end
  end
end
