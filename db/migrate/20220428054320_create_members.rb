class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :lastName
      t.string :firstName
      t.string :middleName
      t.string :suffix
      t.date :birthdate
      t.string :gender
      t.references :cooperative, null: false, foreign_key: true
      t.references :cooperative_branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
