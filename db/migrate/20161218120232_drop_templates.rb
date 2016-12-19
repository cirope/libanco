class DropTemplates < ActiveRecord::Migration[5.0]
  def change
    drop_table :custom_body_templates
    drop_table :body_templates
    add_column :custom_templates, :kind, :string, null: false
    add_column :custom_templates, :content, :text, null: false
  end
end
