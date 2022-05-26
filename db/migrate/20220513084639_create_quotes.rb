class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.references :product#, null: false, foreign_key: true
      t.integer :quote_year
      t.string :issuing_office
      t.string :quote_no
      t.string :name
      t.string :description
      t.references :cooperative#, null: false, foreign_key: true
      t.references :cooperative_branch#, null: false, foreign_key: true
      t.decimal :gross_prem, precision: 10, scale: 2
      t.decimal :service_fee, precision: 10, scale: 2
      t.decimal :net_prem, precision: 10, scale: 2

      t.timestamps
    end
  end
end
