class EmployeeUser < ApplicationRecord
	# belongs_to :division
	# belongs_to :department
	has_one :employee_profile
	accepts_nested_attributes_for :employee_profile

	def to_s
		username
	end
end
