class AddFieldsToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :cellphone, :string, null: false
    add_reference :customers, :workgroup, null: false, index: true
  end
end
