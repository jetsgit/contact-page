## Demo of Mail in Rails 4.0 using Mandrill smtp service and Sidekiq for delayed job. 

### Requires:

* Ruby ~> 2.0

* Sidekiq gem

* [ Mandrill Account ]( http://mandrill.com )

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### Configuration

#### Mandrill:

`# production.rb, test.rb, development.rb or application.rb

YourApp::Application.configure do
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 25, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => ENV["MANDRILL_USERNAME"],
    :password  => ENV["MANDRILL_PASSWORD"], # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'yourdomain.com', # your domain to identify your server when connecting
  }`


