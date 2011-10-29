class CallSmith.Routers.ListContactsRouter extends Backbone.Router
  initialize: (options) ->
    @listContacts = new CallSmith.Collections.ListContactsCollection()
    @listContacts.reset options.listContacts

  routes:
    "list_contacts/new"      : "newListContact"
    "list_contacts/index"    : "index"
    "list_contacts/:id/edit" : "edit"
    "list_contacts/:id"      : "show"
    ".*"        : "index"

  newListContact: ->
    @view = new CallSmith.Views.ListContacts.NewView(collection: @listContacts)
    $("#list_contacts").html(@view.render().el)

  index: ->
    @view = new CallSmith.Views.ListContacts.IndexView(listContacts: @listContacts)
    $("#list_contacts").html(@view.render().el)

  show: (id) ->
    listContact = @listContacts.get(id)
    
    @view = new CallSmith.Views.ListContacts.ShowView(model: listContact)
    $("#list_contacts").html(@view.render().el)
    
  edit: (id) ->
    listContact = @listContacts.get(id)

    @view = new CallSmith.Views.ListContacts.EditView(model: listContact)
    $("#list_contacts").html(@view.render().el)
