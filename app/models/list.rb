class List < ActiveRecord::Base
  has_many :items
  after_initialize :init
  
  def init
    self.votes ||= 0
  end
end
