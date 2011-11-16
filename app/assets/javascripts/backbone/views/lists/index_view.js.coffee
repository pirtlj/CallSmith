CallSmith.Views.Lists ||= {}

class CallSmith.Views.Lists.IndexView extends Backbone.View
	template: JST["backbone/templates/lists/index"]
	className: "Lists-IndexView"

	initialize: () ->
		_.bindAll(this, 'addOne', 'addAll', 'render')
		@options.lists.bind('reset', @addAll)

	addAll: () ->
		@options.lists.each(@addOne)

	addOne: (list) ->
		view = new CallSmith.Views.Lists.ListView({model : list})
		@$("tbody").append(view.render().el)

	render: ->
		$(@el).html(@template(lists: @options.lists.toJSON() ))
		@addAll()

		return this