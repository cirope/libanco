class AllowColumnsNullToCustomer < ActiveRecord::Migration[5.0]
  def change
		change_column_null :customers, :phone, true
		change_column_null :customers, :cellphone, true
		change_column_null :customers, :address, true
		change_column_null :customers, :birthdate, true
		change_column_null :customers, :work_address, true
		change_column_null :customers, :monthly_income, true
		change_column_null :customers, :place_birth, true
		change_column_null :customers, :occupation_id, true
		change_column_null :customers, :city_id, true
		change_column_null :customers, :state_id, true
		change_column_null :customers, :nacionality_id, true
		change_column_null :customers, :marital_status_id, true
		change_column_null :customers, :education_level_id, true
		change_column_null :customers, :adviser_id, true
		change_column_null :customers, :workgroup_id, true
  end
end
