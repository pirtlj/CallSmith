CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.ShowView extends Backbone.View
	template: JST["backbone/templates/lists/show"]	
	className: "Lists-ShowView"
	
	listContacts: null
	
	events:
		'click .button.dial': 'onDialClick'
	
	initialize: (options) ->
		_.bindAll(this, 'addOne', 'addAll', 'render')
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
		
	onDialClick: ->
		@model.connect()