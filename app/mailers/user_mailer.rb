class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def registration_confirmation(user)
  	@user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    m = mail(:to => "kav.adithya@gmail.com", :subject => "Registered", :from => 'kv.citrix1@gmail.com')
    puts m.to_yaml
    puts Rails.application.config.action_mailer.smtp_settings 
    return m
  end
end
