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
    call_gateway = Call.connect(current_user)
    
    flash[:notice] = "Starting calls"
    
    redirect_to root_url
  end


  
  def dial
    @call = Call.find(params[:id])
    @call.complete
    @call.save
    
    render :partial => 'calls/handlers/dial'
  end

  def next
    
    @call = current_user.calls.today.queued.first
    
    # if you have the call sid, you can fetch a call object via:
    call_gateway =  Call.client.account.calls.get(@call.sid)

    # redirect an in-progress call
    call_gateway.redirect_to(dial_call_url(@call, :format => :twiml, :auth_token => current_user.authentication_token))
    
    flash[:notice] = "Starting Next Call"
    redirect_to root_url
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
  
  

 def handle 
    logger.info "Callback Type: " + params[:callback_type]
    
    if params[:callback_type] == "start"
      if current_user.calls.today.pending.count > 0
        
        current_user.calls.today.pending.each{|call|
          call.queue
          call.save
        }
        
        current_user.calls.today.queued.each{|call|
          logger.info "Setting Call Sid: " + params[:CallSid]
          call.sid = params[:CallSid]
          call.save
        }
        
    	  render :partial => 'calls/handlers/start'
      else
        render :partial => 'calls/handlers/empty_queue'
      end
    elsif params[:callback_type] == "start_end"
      render :partial => 'calls/handlers/start_end'
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
        format.html { redirect_to root_url, notice: 'Call was successfully created.' }
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
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
