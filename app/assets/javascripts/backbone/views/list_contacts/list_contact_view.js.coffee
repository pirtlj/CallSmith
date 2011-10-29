CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.ListContactView extends Backbone.View
  template: JST["backbone/templates/list_contacts/list_contact"]
  
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