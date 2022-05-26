json.extract! employee_profile, :id, :employee_user_id, :department_id, :division_id, :employee_no, :last_name, :first_name, :middle_name, :suffix, :birthdate, :age, :created_at, :updated_at
json.url employee_profile_url(employee_profile, format: :json)
