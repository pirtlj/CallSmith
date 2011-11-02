CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.ShowView extends Backbone.View
	template: JST["backbone/templates/lists/show"]	
	className: "Lists-ShowView"
	connected: false
	listContacts: null
	
	events:
		'click .button.connect'	: 'onConnectClick'
		'click .button.dial'	: 'onDialClick'
	
	initialize: (options) ->
		_.bindAll(this, 'addOne', 'addAll', 'render', 'onConnectClick', 'setConnected')
		@listContacts = new CallSmith.Collections.ListContactsCollection()
		@listContacts.bind('reset', @addAll)
		@listContacts.fetch();
	
	addAll: () ->
		@listContacts.each(@addOne)

	addOne: (listContact) ->
		view = new CallSmith.Views.ListContacts.ShowView({model : listContact})
		this.$('#list_contacts').prepend(view.render().el);

	render: ->
		$(this.el).html(@template(@model.toJSON()))
		@listContacts.each(@addOne)
		return this

	onConnectClick: ->
		@model.connect(@setConnected)
	
	onDialClick: ->
		alert("DIAL");
					
	setConnected: ->
		@connected = true
		$(".button.connect").toggle()
		$(".button.dial").toggle()
		