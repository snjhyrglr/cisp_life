class CreateLppiRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :lppi_remarks do |t|
      t.references :quote_item, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true
      t.string :remarks

      t.timestamps
    end
  end
end
