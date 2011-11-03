CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.ShowView extends Backbone.View
	template: JST["backbone/templates/contacts/show"]
	className: "Contacts-ShowView"
	newContactNoteView: null
		
	events:
		'click .button.source'	: 'onSourceClick'
		'click .button.close'	: 'onCloseClick'
		
	initialize: (options) ->
		_.bindAll(this, 'render', 'onSourceClick', 'onCloseClick')
		@model.contactNotes.fetch()
		
	render: ->
		$(this.el).html(@template(@model.toJSON()))

		@newContactNoteView = new CallSmith.Views.ContactNotes.NewView(collection: @model.contactNotes)
		$(this.el).find("#new_contact_note").html(@newContactNoteView.render().el)
		return this
		
	onSourceClick: ->
		window.open("http://www.armadillow.com")
		
	onCloseClick: ->
		window.AppInstance.setSelectedContact(null)