class LppiCoverage < ApplicationRecord
  belongs_to :batch
  belongs_to :cooperative
  belongs_to :cooperative_branch
  belongs_to :member
  belongs_to :product
  has_many :lppi_coverage_item

  before_save :compute_age, :compute_term, :compute_premium 

  # def compute_age 
  #   self.age = self.effectivity.year - self.member.birthdate.year
  # end

  # def compute_term 
  #   self.terms = (self.expiry.year * 12 + self.expiry.month) - (self.effectivity.year * 12 + self.effectivity.month)
  # end

  # def compute_premium 
  #   self.gross_prem = (((self.coverage / 1000) * 1.04) * self.terms)
  #   self.service_fee = self.gross_prem * 0.2
  #   self.net_prem = self.gross_prem - self.service_fee
  # end

  def get_rate 
    
  end


end
