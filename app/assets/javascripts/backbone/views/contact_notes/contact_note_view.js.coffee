CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.ContactNoteView extends Backbone.View
  template: JST["backbone/templates/contact_notes/contact_note"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this