class ContactMailer < ActionMailer::Base
  default from: "anonymous@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_message.subject
  #
  def contact_message(contact)
    @contact = contact
    mail to: "jet@whidbey.com", subject: "Message from Portfolio Contact"
  end
end
