class CooperativeMatrix < ApplicationRecord
  belongs_to :cooperative

  before_save :set_total_premium_rate, :get_rate_id


  def set_total_premium_rate
    self.add_tpd_rate = 0
    self.adb_rate = 0
    self.total_premium_rate = self.premium_rate + self.add_tpd_rate + self.adb_rate
  end

  def get_rate_id 
      self.lppi_rate_id = 
  end

  # def get_add_tpd_rate

  #  self.add_tpd_rate if self.add_tpd_enable?
  #   self.add_tpd_rate = LppiRate.where(between.new(self.premium_rate, (:min_annual_rate).and(:max_annual_rate).add_tpd_rate)
  #  else 
  #       self.
  #  end
  # end
end
