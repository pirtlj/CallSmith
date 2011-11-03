CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.ShowView extends Backbone.View
	template: JST["backbone/templates/lists/show"]	
	className: "Lists-ShowView"
	
	events:
		'click .button.connect'	: 'onConnectClick'
		'click .button.dial'	: 'onDialClick'
		'click .button.cancel'	: 'onCancelClick'
	
	initialize: (options) ->
		_.bindAll(this, 'addOne', 'addAll', 'render', 'onConnectClick', 'onDialClick', 'onCancelClick', 'connectCallback', 'dialCallback', 'cancelCallback')
		@model.listContacts.bind('reset', @addAll)
		@model.listContacts.fetch()

	render: ->
		$(this.el).html(@template(@model.toJSON()))
		@model.listContacts.each(@addOne)
		return this	
		
	addAll: () ->
		@model.listContacts.each(@addOne)

	addOne: (listContact) ->
		view = new CallSmith.Views.ListContacts.ShowView({model : listContact})
		this.$('#list_contacts').prepend(view.render().el);

	onConnectClick: ->
		@model.connect(@connectCallback)
	
	onDialClick: ->
		@model.next(@dialCallback)
	
	onCancelClick: ->
		@model.cancel(@cancelCallback)
						
	connectCallback: ->
		$(".button.connect").toggle()
		$(".button.dial").toggle()
	
	dialCallback: ->
		$(".button.dial").toggle()
		$(".button.cancel").toggle()
		
	cancelCallback: ->	
		$(".button.cancel").toggle()
		$(".button.dial").toggle()
		
		