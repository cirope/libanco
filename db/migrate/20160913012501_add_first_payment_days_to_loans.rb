class AddFirstPaymentDaysToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :first_payment_days, :integer, null: false
  end
end
