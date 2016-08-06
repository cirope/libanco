class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :item, polymorphic: true, null: false, index: true
      t.string :event, null: false
      t.string :whodunnit
      t.jsonb :object
      t.jsonb :object_changes
      t.datetime :created_at
    end
  end
end
