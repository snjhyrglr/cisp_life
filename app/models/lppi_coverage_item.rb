class LppiCoverageItem < ApplicationRecord
  belongs_to :batch
  belongs_to :member
  belongs_to :rate

  # accepts_nested_attributes_for :lppi_coverage

  def compute_premium
    self.term = compute_term
    self.age = compute_age

    self.gross_prem = (((self.coverage / 1000) * 1.04) * self.term)
    self.service_fee = self.gross_prem * 0.2
    self.net_prem = self.gross_prem - self.service_fee
  end

  def compute_term
    (self.expiry.year * 12 + self.expiry.month) - (self.effectivity.year * 12 + self.effectivity.month)
  end

  def compute_age 
    self.effectivity.year - self.member.birthdate.year
  end



end
