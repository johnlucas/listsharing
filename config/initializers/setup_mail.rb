ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "example.com",
  :user_name => "listsharingnotifications@gmail.com",
  :password => "flying_cow!",
  :authentication => "plain",
  :enable_starttls_auto => true
}