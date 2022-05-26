class Quote < ApplicationRecord

  attr_accessor :file # virtual attribute

  belongs_to :product
  belongs_to :cooperative
  belongs_to :cooperative_branch

  has_many :quote_items

  before_save :set_default_attributes

  def set_default_attributes
    self.quote_year = Date.today.year
    self.issuing_office = "HO"

    q_no = sprintf '%05d', (Quote.last.present? ? Quote.last.id : 1)
    self.quote_no = "#{self.product.abbreviation}-#{self.quote_year}-#{self.issuing_office}-#{q_no}"
  end
  

  def create_quote_items_and_compute_premiums(file)
    spreadsheet = Roo::Spreadsheet.open(file)

    (2..spreadsheet.last_row).each do |row|
      mem = Member.find_or_initialize_by(lastName: spreadsheet.cell(row,'A'), firstName: spreadsheet.cell(row,'B'), middleName: spreadsheet.cell(row,'C'), birthdate: spreadsheet.cell(row,'E'))
      # mem.birthdate = spreadsheet.cell(row,'E')
      # mem.gender = 
      mem.cooperative_id = self.cooperative_id
      mem.cooperative_branch_id = self.cooperative_branch_id
      mem.save!

      item = self.quote_items.find_or_initialize_by(member_id: mem.id)
      item.effectivity = spreadsheet.cell(row,'I')
      item.expiry = spreadsheet.cell(row,'J')
      item.coverage = spreadsheet.cell(row,'G')
      item.compute_premium
      item.save!
      
      # self.quote_items << item
		end
  end
  
  def compute_total_premiums
    self.update(
      gross_prem: self.quote_items.sum(:gross_prem), 
      service_fee: self.quote_items.sum(:service_fee), 
      net_prem: self.quote_items.sum(:net_prem) 
      )
  end
  
  def set_batch 
    
  end

end
