class CallSmith.Routers.ContactNotesRouter extends Backbone.Router
  initialize: (options) ->
    @contactNotes = new CallSmith.Collections.ContactNotesCollection()
    @contactNotes.reset options.contactNotes

  routes:
    "/new"      : "newContactNote"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newContactNote: ->
    @view = new CallSmith.Views.ContactNotes.NewView(collection: @contact_notes)
    $("#contact_notes").html(@view.render().el)

  index: ->
    @view = new CallSmith.Views.ContactNotes.IndexView(contact_notes: @contact_notes)
    $("#contact_notes").html(@view.render().el)

  show: (id) ->
    contact_note = @contact_notes.get(id)
    
    @view = new CallSmith.Views.ContactNotes.ShowView(model: contact_note)
    $("#contact_notes").html(@view.render().el)
    
  edit: (id) ->
    contact_note = @contact_notes.get(id)

    @view = new CallSmith.Views.ContactNotes.EditView(model: contact_note)
    $("#contact_notes").html(@view.render().el)
  