class QuoteItem < ApplicationRecord
  belongs_to :quote, optional: true
  belongs_to :member, optional: true
  belongs_to :rate, optional: true
  belongs_to :actuarial_matrix_lppi, optional: true

  # before_save :compute_premium, :compute_term, :compute_age


  def compute_premium
    self.term = compute_term
    self.age = compute_age

    prem_rate = self.get_prem_rate
    coop_comm_rate = self.get_comm_rate
    # puts prem_rate!
    self.gross_prem = (((self.coverage / 1000) * prem_rate) * self.term)
    self.service_fee = self.gross_prem * coop_comm_rate
    self.net_prem = self.gross_prem - self.service_fee
  end

  def compute_term
    (self.expiry.year * 12 + self.expiry.month) - (self.effectivity.year * 12 + self.effectivity.month)
  end

  def compute_age 
    self.effectivity.year - self.member.birthdate.year
  end

  def get_prem_rate
    case quote.product_id 
    when 1 
      case self.age 
      when ..65 then Rate.find_by(max_age: 65).rate # 1.04
      when ..70   # 3.00
        
        if self.coverage < 300000
          Rate.find_by(max_age: 70, max_coverage: 300000).rate
        else
          Rate.find_by(max_age: 70, max_coverage: 2000000).rate
        end
        
      when ..80 
        if self.coverage < 300000
          Rate.find_by(max_age: 70, max_coverage: 300000).rate
        else
          Rate.find_by(max_age: 70, max_coverage: 2000000).rate
        end
         # 5.00
      else Rate.find_by(max_age: 85).rate # 8.75
      end
    when 2 then Rate.find_by(product_id: quote.product_id).rate

    else

    end
    
  end

  def get_comm_rate
    case quote.product_id 
    when 1 
      case self.age 
      when ..65 then Rate.find_by(max_age: 65).coop_comm_rate # 0.2
      when ..85   # 0.1
        Rate.find_by(max_age: 85).coop_comm_rate
      else 0 
      end
    when 2 then Rate.find_by(product_id: quote.product_id).coop_comm_rate
    else

    end
    
  end
  

end
