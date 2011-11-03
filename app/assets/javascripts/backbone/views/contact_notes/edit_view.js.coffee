CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.EditView extends Backbone.View
  template : JST["backbone/templates/contact_notes/edit"]
  
  events :
    "submit #edit-contact_note" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (contact_note) =>
        @model = contact_note
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this