class Member < ApplicationRecord
  belongs_to :cooperative
  belongs_to :cooperative_branch
  has_many :beneficiaries

  has_many :lppi_coverage_items
  has_many :quotes, through: :quote_item

  def to_s
    "#{ firstName ? firstName : "-" } #{middleName ? middleName[0] : "" }. #{ lastName ? lastName : "-" } #{ suffix ? suffix : "-" }"
  end
end
