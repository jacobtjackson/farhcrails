class MessageMailer < ActionMailer::Base
  default to: 'moreinfo@farhc.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome friend')
  end

  def new_message(message)
    @message = message
    @email = message.email
    mail(from: @email, to: 'moreinfo@farhc.com', subject: "Message from #{message.name}")
  end

  def auto_response(message)
    @message = message
    @email = message.email
    mail(from: 'moreinfo@farhc.com', to: @email, subject: "Thank you for your response to Farm & Ranch Healthcare, Inc.!")
  end
end
