CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.ListView extends Backbone.View
	template: JST["backbone/templates/lists/list"]

	events:
		"click" : "onClick"

	tagName: "tr"

	onClick: () ->
		window.AppInstance.setSelectedList(@model)

	render: ->
		$(this.el).html(@template(@model.toJSON() ))    
		return this