class CreateCooperativeMatrices < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperative_matrices do |t|
      t.references :cooperative, null: false, foreign_key: true
      t.references :lppi_rate, null: false, foreign_key: true
      t.string :cooperative_incharge
      t.string :incharge_position
      t.decimal :premium_rate, precision: 5, scale: 2
      t.boolean :add_tpd_enable
      t.decimal :add_tpd_rate, precision: 5, scale: 2
      t.boolean :adb_enable
      t.decimal :adb_rate, precision: 5, scale: 2
      t.decimal :total_premium_rate, precision: 5, scale: 2
      t.decimal :coop_service_fee, precision: 5, scale: 2

      t.timestamps
    end
  end
end
