class Rate < ApplicationRecord
has_many :lppi_coverage_items
belongs_to :product

    def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
			prod = Product.find_or_create_by(abbreviation: spreadsheet.cell(row, 'G'))

			rate = LppiRate.find_or_create_by(min_age: spreadsheet.cell(row,'A'), max_age: spreadsheet.cell(row, 'B'), rate: spreadsheet.cell(row, 'C'),min_coverage: spreadsheet.cell(row,'D'),max_coverage: spreadsheet.cell(row,'E'), coop_comm_rate: spreadsheet.cell(row, 'F'), product_id: prod.id)

			
			puts "* #{rate.min_age} #{rate.max_age} #{rate.rate} - #{rate.product.abbreviation} Save!" if rate.save!
		end
	end
end
