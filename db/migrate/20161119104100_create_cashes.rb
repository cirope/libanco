class CreateCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :cashes do |t|
      t.string :status, null: false
      t.datetime :closed_at
      t.decimal :opening_balance, null: false, precision: 10, scale: 2
      t.decimal :closing_balance, precision: 10, scale: 2
      t.decimal :balance, precision: 10, scale: 2
      t.decimal :incomes_count, precision: 10, scale: 2
      t.decimal :outcomes_count, precision: 10, scale: 2
      t.decimal :difference, precision: 10, scale: 2
      t.text :comment
      t.references :user, null: false, index: true
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end

    add_index :cashes, :status
    add_index :cashes, :created_at
  end
end
