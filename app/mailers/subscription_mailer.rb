class SubscriptionMailer < ActionMailer::Base
  default from: "listsharingnotifications@gmail.com"
  
  def list_update(subscription,list,message)
    @subscription = subscription
    @list = list
    @message = message
    @url = list_items_url(list)
    mail(:to => subscription.email, :subject => "#{list.name} has been updated!")
  end
end
