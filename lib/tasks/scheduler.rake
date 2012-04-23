task :check_list_expired => :environment do
  puts "Nothing to do" if List.find_all_by_expires_and_notified(true,false).empty?

  List.find_all_by_expires_and_notified(true,false).each do |l|
    seconds_left = l.expiry_date - Time.now
    seconds_offset = l.offset * 3600
    percentage_left = (seconds_left * 100) / seconds_offset
    
    if percentage_left <= 10 # if less than 10% then notify users.
      message = "The list is about to expire!"
      l.subscriptions.each do |s| 
        SubscriptionMailer.list_update(s,l,message).deliver
      end
      l.notified = true
      l.save
    else
      s = l.subscriptions.find_by_email('gianluca.trombetta@gmail.com')
      message = "This much is left #{percentage_left} of #{l.offset} hours."
      SubscriptionMailer.list_update(s,l,message).deliver
    end
  end
end