CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.ListView extends Backbone.View
	template: JST["backbone/templates/lists/list"]

	events:
		"click" : "onClick"

	tagName: "tr"
	
	initialize: (options) ->
		_.bindAll(this, 'onClick', 'render')
		@model.listContacts.bind('reset', @render)


	onClick: () ->
		window.AppInstance.setSelectedList(@model)

	render: ->
		@model.set({call_count: @model.listContacts.size()})
		$(this.el).html(@template(@model.toJSON() ))    
		return this