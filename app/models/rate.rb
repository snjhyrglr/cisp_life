class Rate < ApplicationRecord
has_many :lppi_coverage_items

    def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
			rate = Rate.find_or_create_by(min_age: spreadsheet.cell(row,'A'), max_age: spreadsheet.cell(row, 'B'), rate: spreadsheet.cell(row, 'C'),min_coverage: spreadsheet.cell(row,'D'),max_coverage: spreadsheet.cell(row,'E'), coop_comm_rate: spreadsheet.cell(row, 'F'))

			puts "* #{rate.min_age} #{rate.max_age} #{rate.rate} Save!" if rate.save!
		end
	end
end
