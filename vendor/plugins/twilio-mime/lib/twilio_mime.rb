# TwilioMime

Mime::Type.register_alias "text/xml", :twiml

class ActionController::Base

    before_filter :set_twilio_format
    
    def set_twilio_format
      if is_twilio_request?
        request.format = :twiml
      end
    end

private

  #As a security measure to ensure that the request is actually coming from Twilio set a constant to be
  #equal to your Twilio account guid. If the constant is assigned then the Twilio responses will only
  #be returned if the guids match, even if the response type is explicitly requested
  #i.e. myapp.com/foo/show/1.twiml
  #would return a HTML response (the default).
  #If the account guid constant is not explicity set then we make a best guess as to whether this request
  #is coming from Twilio. In this case the response can be explicity requested using the twiml mime type.
  def is_twilio_request?
    #TWILIO_ACCOUNT_GUID = "AC480c16e9c9374d60b82894abc39a269e"
    #twilio_account_SUID = "AC480c16e9c9374d60b82894abc39a269e"
    
    if defined?(twilio_account_SUID)
      #does the request contain a valid account guid
      is_twilio = (params["AccountGuid"] == twilio_account_SUID || params["AccountSid"] == twilio_account_SUID)
      params[:format] = "html" if params[:format] == "twiml" && !is_twilio
      return is_twilio
    else
      return (params.include?("AccountSid") && params.include?("SmsSid")) || (params.include?("AccountGuid") && params.include?("CallGuid"))
    end    
  end
  
end