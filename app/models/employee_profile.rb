class EmployeeProfile < ApplicationRecord
  belongs_to :employee_user
  belongs_to :department
  belongs_to :division

  before_save :compute_age

  def full_name 
    "#{first_name} #{middle_name} #{last_name}"
  end

  def compute_age 
    self.age = Date.today.year - self.birthdate.year
  end
end
