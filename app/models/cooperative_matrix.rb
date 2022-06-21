class CooperativeMatrix < ApplicationRecord
  belongs_to :cooperative

  validate :check_comm_input
  before_save :get_rate_id, :get_add_tpd_rate, :get_adb_rate, :set_total_premium_rate


  def get_rate_id 
    self.lppi_rate_id = LppiRate.find_by('? between min_annual_rate and max_annual_rate', self.premium_rate).id
  end

  def get_add_tpd_rate
   if self.add_tpd_enable?
    self.add_tpd_rate = LppiRate.find_by('? between min_annual_rate and max_annual_rate', self.premium_rate).add_tpd_rate
   else 
        self.add_tpd_rate = 0
   end
  end

  def get_adb_rate
    if self.adb_enable?
    self.adb_rate = LppiRate.find_by('? between min_annual_rate and max_annual_rate', self.premium_rate).adb_rate
   else 
        self.adb_rate = 0
   end
  end

  def set_total_premium_rate
    self.total_premium_rate = self.premium_rate + self.add_tpd_rate + self.adb_rate
  end

  def check_comm_input 
    allowed_comm = LppiRate.find_by('? between min_annual_rate and max_annual_rate', self.premium_rate).max_allowed_comm

    if (self.coop_service_fee * 100) > allowed_comm
      errors.add("Input comm rate below the maximum allowed comm of the premium inputted.")
    end
    
  end
  
end
