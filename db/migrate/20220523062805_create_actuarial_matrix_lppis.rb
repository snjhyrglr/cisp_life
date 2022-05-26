class CreateActuarialMatrixLppis < ActiveRecord::Migration[7.0]
  def change
    create_table :actuarial_matrix_lppis do |t|
      t.integer :min_age
      t.integer :max_age
      t.decimal :min_annual_prem_rate, precision: 10, scale: 2
      t.decimal :max_annual_prem_rate, precision: 10, scale: 2
      t.decimal :max_allowed_comm, precision: 10, scale: 2
      t.references :rider_add_tpd, null: false, foreign_key: true
      t.references :rider_adb, null: false, foreign_key: true

      t.timestamps
    end
  end
end
