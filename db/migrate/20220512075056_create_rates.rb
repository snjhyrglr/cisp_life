class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.integer :min_age
      t.integer :max_age
      t.decimal :min_coverage, precision: 10, scale: 2
      t.decimal :max_coverage, precision: 10, scale: 2
      t.decimal :rate, precision: 10, scale: 2
      t.decimal :coop_comm_rate, precision: 10, scale: 2
      t.references :product

      t.timestamps
    end
  end
end
