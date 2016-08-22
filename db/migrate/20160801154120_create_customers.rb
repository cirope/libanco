class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :identification_type, null: false
      t.string :identification, null: false
      t.string :phone, null: false
      t.string :cellphone, null: false
      t.string :address, null: false
      t.string :email
      t.date :birthdate, null: false
      t.boolean :member, null: false, default: false
      t.string :work_address, null: false
      t.decimal :monthly_income, precision: 10, scale: 2
      t.string :place_birth, null: false
      t.references :occupation, null: false, index: true
      t.references :card, null: false, index: true
      t.references :neighborhood, index: true
      t.references :city, null: false, index: true
      t.references :state, null: false, index: true
      t.references :nacionality, null: false, index: true
      t.references :marital_status, null: false, index: true
      t.references :education_level, null: false, index: true
      t.references :adviser, null: false, index: true
      t.references :workgroup, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
    add_index :customers, :code
    add_index :customers, :name
    add_index :customers, :lastname
    add_index :customers, :identification, unique: true
    add_index :customers, :member
  end
end
