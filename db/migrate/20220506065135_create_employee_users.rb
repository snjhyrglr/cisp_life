class CreateEmployeeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_users do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
