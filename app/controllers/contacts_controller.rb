class ContactsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new(:phone_number => params[:phone_number])
    
    if request.xhr?
      respond_to do |format|
        format.html { render partial: 'new' }
        format.json { render json: @contact }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @contact }
      end
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    
    #TODO Rails needs to improve this -Joseph
    scheduled_for = Date.civil(params[:scheduled_for][:"scheduled_for(1i)"].to_i,params[:scheduled_for][:"scheduled_for(2i)"].to_i,params[:scheduled_for][:"scheduled_for(3i)"].to_i)
    
    @list = current_user.lists.find_or_create_by_scheduled_for(scheduled_for)
    
    @contact = current_user.contacts.new(params[:contact])
    @list.contacts << @contact
    
    if request.xhr?
      if @contact.save && @list.save
        respond_to do |format|
          format.html { render partial: 'new' }
          format.json { render json: @contact }
        end
      end
    else
      respond_to do |format|
        if @contact.save
          format.html { redirect_to [current_user, @contact], notice: 'Contact was successfully created.' }
          format.json { render json: @contact, status: :created, location: @contact }
        else
          format.html { render action: "new" }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to user_contacts_url }
      format.json { head :ok }
    end
  end
end

