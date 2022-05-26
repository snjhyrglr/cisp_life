class CreateCooperativeBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperative_branches do |t|
      t.references :cooperative, null: false, foreign_key: true
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
