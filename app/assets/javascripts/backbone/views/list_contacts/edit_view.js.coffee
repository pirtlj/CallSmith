CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.EditView extends Backbone.View
  template : JST["backbone/templates/list_contacts/edit"]
  
  events :
    "submit #edit-list_contact" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (list_contact) =>
        @model = list_contact
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this