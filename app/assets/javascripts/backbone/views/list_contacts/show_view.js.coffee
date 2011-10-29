CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.ShowView extends Backbone.View
  template: JST["backbone/templates/list_contacts/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this