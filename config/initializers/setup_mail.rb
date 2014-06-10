ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => ENV["EMAIL"],
  :password             => ENV["EMAIL_PASS"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
