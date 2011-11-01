class List < ActiveRecord::Base
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'callsmith.heroku.com'
  
  belongs_to :user
  has_many :list_contacts
  has_many :contacts, :through => :list_contacts
  
  

  def connect
      # put your own credentials here
      account_sid = 'AC480c16e9c9374d60b82894abc39a269e'
      auth_token = '06679fd51c1bddb4643773c77b0d25d3'

      # set up a client to talk to the Twilio REST API
      twilio_client = Twilio::REST::Client.new account_sid, auth_token
    
      twilio_client.account.calls.create(
        :from =>  "2064037411",
        :to   =>  user.phone_number,
        :url  =>  handle_connect_list_url(self, {:format => :twiml, :auth_token => user.authentication_token, :callback_type => "start"})
      )
  end

end
