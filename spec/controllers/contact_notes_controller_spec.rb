require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ContactNotesController do

  # This should return the minimal set of attributes required to create a valid
  # ContactNote. As you add validations to ContactNote, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all contact_notes as @contact_notes" do
      contact_note = ContactNote.create! valid_attributes
      get :index
      assigns(:contact_notes).should eq([contact_note])
    end
  end

  describe "GET show" do
    it "assigns the requested contact_note as @contact_note" do
      contact_note = ContactNote.create! valid_attributes
      get :show, :id => contact_note.id.to_s
      assigns(:contact_note).should eq(contact_note)
    end
  end

  describe "GET new" do
    it "assigns a new contact_note as @contact_note" do
      get :new
      assigns(:contact_note).should be_a_new(ContactNote)
    end
  end

  describe "GET edit" do
    it "assigns the requested contact_note as @contact_note" do
      contact_note = ContactNote.create! valid_attributes
      get :edit, :id => contact_note.id.to_s
      assigns(:contact_note).should eq(contact_note)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ContactNote" do
        expect {
          post :create, :contact_note => valid_attributes
        }.to change(ContactNote, :count).by(1)
      end

      it "assigns a newly created contact_note as @contact_note" do
        post :create, :contact_note => valid_attributes
        assigns(:contact_note).should be_a(ContactNote)
        assigns(:contact_note).should be_persisted
      end

      it "redirects to the created contact_note" do
        post :create, :contact_note => valid_attributes
        response.should redirect_to(ContactNote.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact_note as @contact_note" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContactNote.any_instance.stub(:save).and_return(false)
        post :create, :contact_note => {}
        assigns(:contact_note).should be_a_new(ContactNote)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContactNote.any_instance.stub(:save).and_return(false)
        post :create, :contact_note => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contact_note" do
        contact_note = ContactNote.create! valid_attributes
        # Assuming there are no other contact_notes in the database, this
        # specifies that the ContactNote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ContactNote.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => contact_note.id, :contact_note => {'these' => 'params'}
      end

      it "assigns the requested contact_note as @contact_note" do
        contact_note = ContactNote.create! valid_attributes
        put :update, :id => contact_note.id, :contact_note => valid_attributes
        assigns(:contact_note).should eq(contact_note)
      end

      it "redirects to the contact_note" do
        contact_note = ContactNote.create! valid_attributes
        put :update, :id => contact_note.id, :contact_note => valid_attributes
        response.should redirect_to(contact_note)
      end
    end

    describe "with invalid params" do
      it "assigns the contact_note as @contact_note" do
        contact_note = ContactNote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContactNote.any_instance.stub(:save).and_return(false)
        put :update, :id => contact_note.id.to_s, :contact_note => {}
        assigns(:contact_note).should eq(contact_note)
      end

      it "re-renders the 'edit' template" do
        contact_note = ContactNote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContactNote.any_instance.stub(:save).and_return(false)
        put :update, :id => contact_note.id.to_s, :contact_note => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact_note" do
      contact_note = ContactNote.create! valid_attributes
      expect {
        delete :destroy, :id => contact_note.id.to_s
      }.to change(ContactNote, :count).by(-1)
    end

    it "redirects to the contact_notes list" do
      contact_note = ContactNote.create! valid_attributes
      delete :destroy, :id => contact_note.id.to_s
      response.should redirect_to(contact_notes_url)
    end
  end

end
