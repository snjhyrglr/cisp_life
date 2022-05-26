class CreateLppiCoverages < ActiveRecord::Migration[7.0]
  def change
    create_table :lppi_coverages do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :cooperative, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :age
      t.date :effectivity
      t.date :expiry
      t.integer :terms
      t.decimal :coverage, precision: 10, scale: 2
      t.decimal :gross_prem, precision: 8, scale: 2
      t.decimal :service_fee, precision: 8, scale: 2
      t.decimal :net_prem, precision: 8, scale: 2

      t.timestamps
    end
  end
end
