require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact_message" do
    mail = ContactMailer.contact_message(contact = contacts(:two))
    assert_equal "Message from Portfolio Contact", mail.subject
    assert_equal ["jet@whidbey.com"], mail.to
    assert_equal ["anonymous@example.com"], mail.from
    assert_match "Greetings from #{contacts(:two).name}, who has sent you the following message:\r\n#{contacts(:two).msg}", mail.body.encoded
  end

end
