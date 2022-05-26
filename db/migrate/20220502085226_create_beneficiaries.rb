class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.references :member, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :relationship
      t.boolean :I_R

      t.timestamps
    end
  end
end
