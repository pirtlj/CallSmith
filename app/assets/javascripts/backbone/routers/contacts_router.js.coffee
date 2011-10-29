class CallSmith.Routers.ContactsRouter extends Backbone.Router
  initialize: (options) ->
    @contacts = new CallSmith.Collections.ContactsCollection()
    @contacts.reset options.contacts

  routes:
    "/new"      : "newContact"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newContact: ->
    @view = new CallSmith.Views.Contacts.NewView(collection: @contacts)
    $("#contacts").html(@view.render().el)

  index: ->
    @view = new CallSmith.Views.Contacts.IndexView(contacts: @contacts)
    $("#contacts").html(@view.render().el)

  show: (id) ->
    contact = @contacts.get(id)
    
    @view = new CallSmith.Views.Contacts.ShowView(model: contact)
    $("#contacts").html(@view.render().el)
    
  edit: (id) ->
    contact = @contacts.get(id)

    @view = new CallSmith.Views.Contacts.EditView(model: contact)
    $("#contacts").html(@view.render().el)
  