
class CallSmith.Views.ApplicationView extends Backbone.View
	
	template: JST["backbone/templates/application"]
	lists:	null
	selectedList: null
	listView: null
		
	initialize: (options) ->
		@el = $('#CallSmithApp')
		@lists = new CallSmith.Collections.ListsCollection()
		
		@lists.reset(options.lists)
		@selectedList = @lists.at(0)
		
		@listView = new CallSmith.Views.Lists.ShowView(model: @selectedList)
		@render()

	render: ->
		$(@el).html(@template())
		$("#col-left").html(@listView.render().el)
		
		return this

