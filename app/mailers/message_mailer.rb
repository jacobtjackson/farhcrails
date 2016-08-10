class MessageMailer < ActionMailer::Base
  default from: 'postmaster@sandbox364a4748caff4ebbbe8def7ba8b485ea.mailgun.org'
  default to: 'jacob.t.jackson@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome friend')
  end

  def new_message(message)
    @message = message
    mail subject: "Message from #{message.name}"
  end
end
