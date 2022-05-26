class Cooperative < ApplicationRecord

	def to_s
		name 
	end

	def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
			coop = Cooperative.find_or_create_by(name: spreadsheet.cell(row,'A'), address: "-")
			branch = CooperativeBranch.find_or_create_by(cooperative_id: coop.id, name: spreadsheet.cell(row,'B').to_s.strip, address: "-")

			puts "* #{coop.name} #{branch.name}" if branch.save!
		end
	end

end
