class List < ActiveRecord::Base
  has_many :items
  after_initialize :init
  before_save :set_expiry_date
  has_many :subscriptions
  
  private
    def init
      self.votes ||= 0
      self.offset ||= 0
      self.notified ||= false
    end
    
    def set_expiry_date
      if self.offset == 0
        self.expires = false
        self.expiry_date = nil
      else
        self.expiry_date = Time.now + self.offset.hours
        self.expires = true
      end
    end
end
