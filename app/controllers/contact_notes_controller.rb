class ContactNotesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /contact_notes
  # GET /contact_notes.json
  def index
    @contact_notes = current_user.contacts.find(params[:contact_id]).contact_notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_notes }
    end
  end

  # GET /contact_notes/1
  # GET /contact_notes/1.json
  def show
    @contact_note = current_user.contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_note }
    end
  end

  # GET /contact_notes/new
  # GET /contact_notes/new.json
  def new
    @contact_note = current_user.contacts.find(params[:contact_id]).contact_notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_note }
    end
  end

  # GET /contact_notes/1/edit
  def edit
    @contact_note = current_user.contacts.find(params[:id])
  end

  # POST /contact_notes
  # POST /contact_notes.json
  def create
    @contact_note = current_user.contacts.new(params[:contact_note])

    respond_to do |format|
      if @contact_note.save
        format.html { redirect_to @contact_note, notice: 'Contact note was successfully created.' }
        format.json { render json: @contact_note, status: :created, location: @contact_note }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_notes/1
  # PUT /contact_notes/1.json
  def update
    @contact_note = current_user.contacts.find(params[:id])

    respond_to do |format|
      if @contact_note.update_attributes(params[:contact_note])
        format.html { redirect_to @contact_note, notice: 'Contact note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_notes/1
  # DELETE /contact_notes/1.json
  def destroy
    @contact_note = current_user.contacts.find(params[:id])
    @contact_note.destroy

    respond_to do |format|
      format.html { redirect_to contact_notes_url }
      format.json { head :ok }
    end
  end
end
