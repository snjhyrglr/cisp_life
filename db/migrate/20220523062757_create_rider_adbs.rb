class CreateRiderAdbs < ActiveRecord::Migration[7.0]
  def change
    create_table :rider_adbs do |t|
      t.decimal :rate, precision: 10, scale: 2

      t.timestamps
    end
  end
end
