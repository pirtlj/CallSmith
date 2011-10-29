CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.EditView extends Backbone.View
  template : JST["backbone/templates/lists/edit"]
  
  events :
    "submit #edit-list" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (list) =>
        @model = list
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this