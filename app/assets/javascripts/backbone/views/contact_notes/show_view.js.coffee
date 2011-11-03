CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.ShowView extends Backbone.View
	template: JST["backbone/templates/contact_notes/show"]

	render: ->
		$(this.el).html(@template(@model.toJSON() ))
		return this