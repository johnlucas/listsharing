class List < ActiveRecord::Base
  has_many :items
  after_initialize :init
  before_save :set_expiry_date
  
  private
    def init
      self.votes ||= 0
    end
    
    def set_expiry_date
      if self.offset == 0
        self.expiry_date = nil
      else
        self.expiry_date = Time.now + self.offset.hours
      end
    end
end
