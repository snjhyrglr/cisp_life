class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
