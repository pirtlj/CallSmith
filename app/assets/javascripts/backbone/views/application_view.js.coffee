
class CallSmith.Views.ApplicationView extends Backbone.View
	
	template: JST["backbone/templates/application"]
	lists:	null
	selectedList: null
	selectedContact: null
	listView: null
	contactView: null
	
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
	
	setSelectedContact: (contact) ->
		if @contactView
			$(@contactView.el).animate(
				left: "0%"
			, 1000, (elm)->
				$(@).remove()
			)
		
		@contactView = new CallSmith.Views.Contacts.ShowView(model: contact)
		$(".layout-wraper").append(@contactView.render().el)
		
		$(@contactView.el).animate(
			left: "50%"
		, 1000)
		

