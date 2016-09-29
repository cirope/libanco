class ChangeColumnsToLoans < ActiveRecord::Migration[5.0]
  def change
    rename_column :loans, :amortization_system, :type
    change_column_default :loans, :commission_amount, 0
    change_column_default :loans, :interest_amount, 0
    change_column_default :loans, :tax_amount, 0
    change_column_default :loans, :tax_perception_amount, 0
    change_column_default :loans, :gross_income_perception_amount, 0
    change_column_default :loans, :insurance_amount, 0
    change_column_default :loans, :stamped_amount, 0
  end
end
