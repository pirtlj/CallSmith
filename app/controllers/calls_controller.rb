class CallsController < ApplicationController
  before_filter :authenticate_user!
  # GET /calls
  # GET /calls.json
  def index
    @calls = current_user.calls

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  def start
  end
  
  def stop
  end
  
  def next
  end
  

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
      format.twiml {  }
    end
  end
  
  
  def dial
    @call = Call.find(params[:id])
    
    
    # put your own credentials here
    account_sid = 'AC480c16e9c9374d60b82894abc39a269e'
    auth_token = '06679fd51c1bddb4643773c77b0d25d3'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    # make a new outgoing call
    @client.account.calls.create(
      :from => '+12064037411',
      :to => '+12064037411',
      :url => handler_call_url(@call, :format => :twiml, :auth_token => current_user.authentication_token, :callback_type => "start"),
      :StatusCallback  =>  handler_call_url(@call, :format => :twiml, :auth_token => current_user.authentication_token, :callback_type => "stop")
    )
    flash[:notice] = "Dialing..."
    redirect_to root_url()
  end

 def handler 
    @call = Call.find(params[:id])
    
    logger.info "Callback Type: " + params[:callback_type]
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
      format.twiml {  }
    end
 end
 
 def status_callback
   
 end


  # GET /calls/new
  # GET /calls/new.json
  def new
    @call = Call.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/1/edit
  def edit
    @call = Call.find(params[:id])
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(params[:call])

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render json: @call, status: :created, location: @call }
      else
        format.html { render action: "new" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.json
  def update
    @call = Call.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :ok }
    end
  end
end
