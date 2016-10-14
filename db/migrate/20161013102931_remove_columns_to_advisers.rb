class RemoveColumnsToAdvisers < ActiveRecord::Migration[5.0]
  def change
    remove_column :advisers, :lastname
    remove_column :advisers, :identification_type
    remove_column :advisers, :identification
    remove_column :advisers, :phone
    add_index :advisers, :name, unique: true
  end
end
