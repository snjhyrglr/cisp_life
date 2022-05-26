class CreateCooperatives < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.string :address
      t.string :abbreviation

      t.timestamps
    end
  end
end
