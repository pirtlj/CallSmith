
class CallSmith.Views.ApplicationView extends Backbone.View
	
	template: JST["backbone/templates/application"]
	lists:	null
	selectedList: null
	selectedContact: null
	listView: null
	listsView: null
	contactView: null
	
	initialize: (options) ->
		@el = $('#CallSmithApp')

		@lists = new CallSmith.Collections.ListsCollection()
		@lists.reset(options.lists)

		@listsView = new CallSmith.Views.Lists.IndexView(lists: @lists)

		@selectedList = @lists.get(options.currentListId)

		if @selectedList
			@listView = new CallSmith.Views.Lists.ShowView(model: @selectedList)
		
		@render()

	render: ->
		$(@el).html(@template())
		$("#col-left").html(@listsView.render().el)
		
		if @listView
			$("#col-left").html(@listView.render().el)
		
		return this
		
	setSelectedList: (list) ->
		@selectedList = list
		
		if @selectedList
			@listView = new CallSmith.Views.Lists.ShowView(model: @selectedList)
		else
			@listView = null
			
		@render()
	
	setSelectedContact: (contact) ->
		$('.ListContacts-ShowView').removeClass('selected')
		
		animationDuration = 150;
		if @contactView
			$(@contactView.el).animate(
				left: "0%"
			, animationDuration, (elm)->
				$(@).remove()
			)
			
		if contact
			@contactView = new CallSmith.Views.Contacts.ShowView(model: contact)
			$(".layout-wraper").append(@contactView.render().el)
			$(@contactView.el).animate(
				left: "50%"
			, animationDuration)
		

