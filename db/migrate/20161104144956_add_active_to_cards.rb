class AddActiveToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :active, :boolean, null: false, default: true
    add_index :cards, :active
  end
end
