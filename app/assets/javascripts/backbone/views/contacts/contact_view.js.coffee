CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.ContactView extends Backbone.View
  template: JST["backbone/templates/contacts/contact"]
  
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