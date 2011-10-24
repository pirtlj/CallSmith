class Call < ActiveRecord::Base
  include AASM

  belongs_to :contact
  
  aasm_initial_state :pending

  aasm_state :pending
  aasm_state :queued
  aasm_state :completed


  aasm_event :queue do
    transitions :to => :queued, :from => [:pending]
  end
  
  aasm_event :complete do
    transitions :to => :completed, :from => [:queued]
  end
  
  
  class << self
    include ActionDispatch::Routing::UrlFor
    include Rails.application.routes.url_helpers
    default_url_options[:host] = 'callsmith.heroku.com'
    
    def client
      # put your own credentials here
      account_sid = 'AC480c16e9c9374d60b82894abc39a269e'
      auth_token = '06679fd51c1bddb4643773c77b0d25d3'

      # set up a client to talk to the Twilio REST API
      return Twilio::REST::Client.new account_sid, auth_token
    end
      
    def today
      where(:scheduled_for => Date.today)
    end
      
    def connect user
        Call.client.account.calls.create(
          :from => user.phone_number,
          :to => user.phone_number,
          :url => handle_calls_url(:format => :twiml, :auth_token => user.authentication_token, :callback_type => "start"),
          :StatusCallback  =>  handle_calls_url(:format => :twiml, :auth_token => user.authentication_token, :callback_type => "start_end")
        )
    end  
      
      
    def dial calls
      
    end
    
  end
  
  
  #refrences

  def same_day
    Call.where(:scheduled_for => self.scheduled_for).order("created_at ASC")
  end
  
  def next
    self.same_day.where("created_at > :start_date", {:start_date => self.created_at}).first
  end
  
  def client_call
    Call.client.account.calls.get(self.sid)
  end
  
  
  def redirect
    # redirect an in-progress call
    client_call.redirect_to('http://myapp.com/call-redirect')
  end
  
end
