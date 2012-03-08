class Item < ActiveRecord::Base
  belongs_to :list
  
  after_initialize :init
  
  def init
    self.votes ||= 0
  end
end
