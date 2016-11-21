class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :identification_type, null: false
      t.string :identification, null: false
      t.string :phone, null: false
      t.string :cellphone, null: false
      t.string :address, null: false
      t.references :city, null: false, index: true
      t.references :state, null: false, index: true
      t.references :investment_group, null: false, index: true
      t.references :consultant, null: false, index: true
      t.references :user, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :investors, :name
    add_index :investors, :lastname
    add_index :investors, :identification, unique: true
  end
end
