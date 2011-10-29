CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.IndexView extends Backbone.View
  template: JST["backbone/templates/list_contacts/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.listContacts.bind('reset', @addAll)
   
  addAll: () ->
    @options.listContacts.each(@addOne)
  
  addOne: (listContact) ->
    view = new CallSmith.Views.ListContacts.ListContactView({model : listContact})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(listContacts: @options.listContacts.toJSON() ))
    @addAll()
    
    return this