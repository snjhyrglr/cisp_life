class CreateLppiRates < ActiveRecord::Migration[7.0]
  def change
    create_table :lppi_rates do |t|
      t.integer :min_age
      t.integer :max_age
      t.decimal :min_coverage, precision: 15, scale: 2
      t.decimal :max_coverage, precision: 15, scale: 2
      t.decimal :min_annual_rate, precision: 5, scale: 3
      t.decimal :max_annual_rate, precision: 5, scale: 3
      t.decimal :min_monthly_rate, precision: 5, scale: 3
      t.decimal :max_monthly_rate, precision: 5, scale: 3
      t.decimal :max_allowed_comm, precision: 5, scale: 2
      t.references :rider_add_tpd, null: false, foreign_key: true
      t.decimal :add_tpd_rate, precision: 5, scale: 2
      t.references :rider_adb, null: false, foreign_key: true
      t.decimal :adb_rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end
