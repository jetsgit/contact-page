## Mail in Rails 4.0 using Mandrill and Sidekiq.  

### Requires:

* Ruby ~> 2.0

* Redis Server

* [sidekiq gem](https://github.com/mperham/sidekiq)

* [ Mandrill Account ]( http://mandrill.com )

* [figaro gem](https://github.com/lasaerlemon/figaro)
 


### Configuration

* Scaffold `contact` to create MVC

    `bundle exec rails g scaffold Contact name email phone msg:text`

* `bundle exec rake db:migrate`
* Generate the mailer

    `bundle exec rails g mailer contact_mailer contact_message`


#### figaro

**Install**

* addd figaro to Gemfile
* bundle
* run    `figaro install`
* add secret keys for Mandrill in `config/application.yml`
```
MANDRILL_USERNAME: "joe.developer@gmail.com"
MANDRILL_PASSWD: "verysecret_mandrill_api_key"
```

#### Mandrill:

production.rb, test.rb, development.rb or application.rb

```
YourApp::Application.configure do
  config.action_mailer.default charset: "utf-8"
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 25, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => ENV["MANDRILL_USERNAME"],
    :password  => ENV["MANDRILL_PASSWORD"], # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'yourdomain.com', # your domain to identify your server when connecting
  }
```

#### contacts_controller.rb


```

#### sidekiq

* add sidekiq to Gemfile
* bundle
* create `config/initializers/redis.rb`

    ...with the following code:
```
$redis = Redis.new(:host => 'localhost', :port => 6379)
```
* contacts_controller.rb 

    Edit `create` and invoke mailer,
    send email after 2 minute delay:
```
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.delay_for(2.minute).contact_message(@contact)

* start sidekiq

`bundle exec sidekiq`

  
####TBD

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

