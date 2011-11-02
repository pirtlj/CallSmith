CallSmith.Views.Contacts ||= {}

class CallSmith.Views.Contacts.ShowView extends Backbone.View
	template: JST["backbone/templates/contacts/show"]
	className: "Contacts-ShowView"
		
	events:
		'click .button.source'	: 'onSourceClick'
		'click .button.close'	: 'onCloseClick'
		
	initialize: (options) ->
		_.bindAll(this, 'render', 'onSourceClick', 'onCloseClick')
		
	render: ->
		$(this.el).html(@template(@model.toJSON() ))
		return this
		
	onSourceClick: ->
		window.open("http://www.armadillow.com")
		
	onCloseClick: ->
		window.AppInstance.setSelectedContact(null)