json.extract! employee_user, :id, :username, :password, :created_at, :updated_at
json.url employee_user_url(employee_user, format: :json)
