class Batch < ApplicationRecord
  belongs_to :product

  has_many :lppi_coverage_items
  has_many :members, through: :lppi_coverage_items

  def to_s
    name
  end
  
  def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

    (9..44).each do |row|
			# coop = Cooperative.find_or_create_by(name: spreadsheet.cell(row,'A'), address: "-")
			# branch = CooperativeBranch.find_or_create_by(cooperative_id: coop.id, name: spreadsheet.cell(row,'B').to_s.strip, address: "-")
      # coop_id = coop.id 
      # branch_id = branch.id
      mem = Member.find_or_initialize_by(last_name: spreadsheet.cell(row,'D'), first_name: spreadsheet.cell(row,'F'), middle_name: spreadsheet.cell(row,'G'))
      mem.birthdate = spreadsheet.cell(row,'J')
      # mem.gender = 
      mem.coop_id = 1
      mem.coop_branch_id = 1
      mem.save!

      item = self.lppi_coverage_items.find_or_initialize_by(member_id: mem.id)
      item.effectivity = spreadsheet.cell(row,'T')
      item.expiry = spreadsheet.cell(row,'U')
      item.compute_premium
      
      batch << item

		end
	end

end
