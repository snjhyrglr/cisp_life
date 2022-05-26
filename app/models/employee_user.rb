class EmployeeUser < ApplicationRecord
	has_one :employee_profile
	accepts_nested_attributes_for :employee_profile

	def to_s
		username
	end
end
