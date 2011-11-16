CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.ShowView extends Backbone.View
	template: JST["backbone/templates/contacts/show"]
	className: "Contacts-ShowView"
	newContactNoteView: null
	contactNotesview: null
		
	events:
		'click .button.source'	: 'onSourceClick'
		'click .button.close'	: 'onCloseClick'
		
	initialize: (options) ->
		_.bindAll(this, 'render', 'onSourceClick', 'onCloseClick', 'onDateSelect')
		@model.contactNotes.fetch()
		
		@newContactNoteView = new CallSmith.Views.ContactNotes.NewView(collection: @model.contactNotes)
		@contactNotesview = new CallSmith.Views.ContactNotes.IndexView(contactNotes: @model.contactNotes)
		
	render: ->
		$(this.el).html(@template(@model.toJSON()))

		$(this.el).find("#new_contact_note").html(@newContactNoteView.render().el)
		$(this.el).find("#contact_notes").html(@contactNotesview.render().el)
		
		$(this.el).find( "#datepicker" ).datepicker({
					showOn: "button",
					buttonImage: "images/calendar.gif",
					buttonImageOnly: true
					onSelect: @onDateSelect
				})
		
		return this
		
	onSourceClick: ->
		window.open("http://www.armadillow.com")
		
	onCloseClick: ->
		window.AppInstance.setSelectedContact(null)
		
	onDateSelect: ->
		alert("date picked");