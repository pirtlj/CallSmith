CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.IndexView extends Backbone.View
  template: JST["backbone/templates/contact_notes/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.contactNotes.bind('reset', @addAll)
   
  addAll: () ->
    @options.contactNotes.each(@addOne)
  
  addOne: (contactNote) ->
    view = new CallSmith.Views.ContactNotes.ContactNoteView({model : contactNote})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(contactNotes: @options.contactNotes.toJSON() ))
    @addAll()
    
    return this