class Subscription < ActiveRecord::Base
  belongs_to :lists
  validates :email, :uniqueness => {:scope => :list_id}
end
