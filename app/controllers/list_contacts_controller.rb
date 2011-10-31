class ListContactsController < ApplicationController
  # GET /list_contacts
  # GET /list_contacts.json
  def index
    @list_contacts = ListContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_contacts.to_json(:include => {
                                                          :contact => {
                                                            :only => [ :id, :first_name, :last_name, :phone_number ] } } ) }
    end
  end

  # GET /list_contacts/1
  # GET /list_contacts/1.json
  def show
    @list_contact = ListContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_contact }
    end
  end

  # GET /list_contacts/new
  # GET /list_contacts/new.json
  def new
    @list_contact = ListContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_contact }
    end
  end

  # GET /list_contacts/1/edit
  def edit
    @list_contact = ListContact.find(params[:id])
  end

  # POST /list_contacts
  # POST /list_contacts.json
  def create
    @list_contact = ListContact.new(params[:list_contact])

    respond_to do |format|
      if @list_contact.save
        format.html { redirect_to @list_contact, notice: 'List contact was successfully created.' }
        format.json { render json: @list_contact, status: :created, location: @list_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @list_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_contacts/1
  # PUT /list_contacts/1.json
  def update
    @list_contact = ListContact.find(params[:id])

    respond_to do |format|
      if @list_contact.update_attributes(params[:list_contact])
        format.html { redirect_to @list_contact, notice: 'List contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_contacts/1
  # DELETE /list_contacts/1.json
  def destroy
    @list_contact = ListContact.find(params[:id])
    @list_contact.destroy

    respond_to do |format|
      format.html { redirect_to list_contacts_url }
      format.json { head :ok }
    end
  end
end
