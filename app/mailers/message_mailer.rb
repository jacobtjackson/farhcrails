class MessageMailer < ActionMailer::Base
  default to: 'jacob.t.jackson@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome friend')
  end

  def new_message(message)
    @message = message
    @email = message.email
    mail(from: @email, to: 'jacob.t.jackson@gmail.com', subject: "Message from #{message.name}")
  end

  def auto_response(message)
    attachments.inline['twitter.png'] = File.read("#{Rails.root.join('assets', 'images', 'twitter.png')}")
    attachments.inline['linkedin.png'] = File.read("#{Rails.root.join('assets', 'images', 'linkedin.png')}")
    attachments.inline['facebook.png'] = File.read("#{Rails.root.join('assets', 'images', 'facebook.png')}")
    attachments.inline['youtube.png'] = File.read("#{Rails.root.join('assets', 'images', 'youtube.png')}")
    @message = message
    @email = message.email
    mail(from: 'jacob.t.jackson@gmail.com', to: @email, subject: "Thank you for your response to Farm & Ranch Insurance Services!")
  end
end
