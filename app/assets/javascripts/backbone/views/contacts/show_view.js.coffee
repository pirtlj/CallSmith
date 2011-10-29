CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.ShowView extends Backbone.View
  template: JST["backbone/templates/contacts/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this