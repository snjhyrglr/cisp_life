class ActuarialMatrixLppi < ApplicationRecord
  belongs_to :rider_add_tpd
  belongs_to :rider_adb


  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
      add_add_tpd = RiderAddTpd.find_or_initialize_by(rate: spreadsheet.cell(row,'H')) 
      add_add_tpd.save!

      add_adb = RiderAdb.find_or_initialize_by(rate: spreadsheet.cell(row,'I')) 
      add_adb.save!

      act_rate = ActuarialMatrixLppi.new(min_age: spreadsheet.cell(row,'A'))
      act_rate.max_age = spreadsheet.cell(row,'B')
      act_rate.min_annual_prem_rate = spreadsheet.cell(row,'C')
      act_rate.max_annual_prem_rate = spreadsheet.cell(row,'D')
      act_rate.max_allowed_comm = spreadsheet.cell(row,'G')
      act_rate.rider_add_tpd_id = add_add_tpd.id 
      act_rate.rider_adb_id = add_adb.id

			puts "* #{act_rate.min_age} #{act_rate.max_age} #{act_rate.min_annual_prem_rate} #{act_rate.max_annual_prem_rate}  Save!" if act_rate.save!
		end
  end
end
