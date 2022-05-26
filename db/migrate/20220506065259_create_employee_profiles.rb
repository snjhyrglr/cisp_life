class CreateEmployeeProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_profiles do |t|
      t.references :employee_user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true
      t.string :employee_no
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffix
      t.date :birthdate
      t.integer :age

      t.timestamps
    end
  end
end
