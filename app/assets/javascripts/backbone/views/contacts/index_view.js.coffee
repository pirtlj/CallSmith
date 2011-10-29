CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.IndexView extends Backbone.View
  template: JST["backbone/templates/contacts/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.contacts.bind('reset', @addAll)
   
  addAll: () ->
    @options.contacts.each(@addOne)
  
  addOne: (contact) ->
    view = new CallSmith.Views.Contacts.ContactView({model : contact})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(contacts: @options.contacts.toJSON() ))
    @addAll()
    
    return this