class CallSmith.Routers.ListsRouter extends Backbone.Router
  initialize: (options) ->
    @lists = new CallSmith.Collections.ListsCollection()
    @lists.reset options.lists

  routes:
    "lists/new"      : "newList"
    "lists/index"    : "index"
    "lists/:id/edit" : "edit"
    "lists/:id"      : "show"
    ".*"        : "index"

  newList: ->
    @view = new CallSmith.Views.Lists.NewView(collection: @lists)
    $("#lists").html(@view.render().el)

  index: ->
    @view = new CallSmith.Views.Lists.IndexView(lists: @lists)
    $("#lists").html(@view.render().el)

  show: (id) ->
    list = @lists.get(id)
    
    @view = new CallSmith.Views.Lists.ShowView(model: list)
    $("#lists").html(@view.render().el)
    
  edit: (id) ->
    list = @lists.get(id)

    @view = new CallSmith.Views.Lists.EditView(model: list)
    $("#lists").html(@view.render().el)
  