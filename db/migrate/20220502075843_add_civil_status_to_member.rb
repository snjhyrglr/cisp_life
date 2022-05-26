class AddCivilStatusToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :civil_status, :string
  end
end
