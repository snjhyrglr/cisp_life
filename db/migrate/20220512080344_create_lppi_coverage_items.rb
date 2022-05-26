class CreateLppiCoverageItems < ActiveRecord::Migration[7.0]
  def change
    create_table :lppi_coverage_items do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.date :effectivity
      t.date :expiry
      t.integer :term
      t.integer :age
      t.decimal :coverage, precision: 15, scale: 2
      t.references :rate, null: false, foreign_key: true
      t.decimal :prem_rate, precision: 10, scale: 2
      t.decimal :gross_prem, precision: 10, scale: 2
      t.decimal :service_fee, precision: 10, scale: 2
      t.decimal :net_prem, precision: 10, scale: 2

      t.timestamps
    end
  end
end
