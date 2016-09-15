class AddExtraIntToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :extra_interest, :decimal, precision: 12, scale: 4, null: false, default: 0
    add_column :payments, :tax_interest, :decimal, precision: 12, scale: 4, null: false, default: 0
  end
end
