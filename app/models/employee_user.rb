class EmployeeUser < ApplicationRecord
	has_many :employee_profiles
	accepts_nested_attributes_for :employee_profiles

	def to_s
		username
	end
end
