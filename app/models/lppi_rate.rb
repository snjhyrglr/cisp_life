class LppiRate < ApplicationRecord
  belongs_to :rider_add_tpd
  belongs_to :rider_adb

  def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
      
      add_tpd = RiderAddTpd.find_or_create_by(rate: spreadsheet.cell(row,'J'))
      adb = RiderAdb.find_or_create_by(rate: spreadsheet.cell(row, 'K'))

			rate = LppiRate.find_or_create_by(min_age: spreadsheet.cell(row,'A'), max_age: spreadsheet.cell(row, 'B'), min_coverage: spreadsheet.cell(row,'C'),max_coverage: spreadsheet.cell(row,'D'), min_annual_rate: spreadsheet.cell(row, 'E'), max_annual_rate: spreadsheet.cell(row, 'F'), min_monthly_rate: spreadsheet.cell(row, 'G'), max_monthly_rate: spreadsheet.cell(row, 'H'), max_allowed_comm: spreadsheet.cell(row, 'I'), rider_add_tpd_id: add_tpd.id, add_tpd_rate: add_tpd.rate, rider_adb_id: adb.id, adb_rate: adb.rate)

			
			puts "* #{rate.min_age} #{rate.max_age} #{rate.add_tpd_rate} #{rate.adb_rate} Save!" if rate.save!
		end
	end

end
