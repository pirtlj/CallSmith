CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.NewView extends Backbone.View    
  template: JST["backbone/templates/list_contacts/new"]
  
  events:
    "submit #new-list_contact": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (list_contact) =>
        @model = list_contact
        window.location.hash = "/#{@model.id}"
        
      error: (list_contact, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this