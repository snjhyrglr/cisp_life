class LppiRemark < ApplicationRecord
  belongs_to :quote_item
  belongs_to :quote
  
  validates_presence_of :remarks
end
