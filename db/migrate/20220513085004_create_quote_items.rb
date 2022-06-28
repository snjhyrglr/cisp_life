class CreateQuoteItems < ActiveRecord::Migration[7.0]
  def change
    create_table :quote_items do |t|
      t.references :quote#, null: false, foreign_key: true
      t.references :member#, null: false, foreign_key: true
      t.integer :age
      t.date :effectivity
      t.date :expiry
      t.integer :term
      t.references :rate#, null: false, foreign_key: true
      t.decimal :coverage, precision: 10, scale: 2
      t.decimal :prem_rate, precision: 10, scale: 2
      t.decimal :gross_prem, precision: 10, scale: 2
      t.decimal :service_fee, precision: 10, scale: 2
      t.decimal :net_prem, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
