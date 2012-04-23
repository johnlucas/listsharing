class SubscriptionMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def list_update(subscription)
    @subscription = subscription
  end
end
