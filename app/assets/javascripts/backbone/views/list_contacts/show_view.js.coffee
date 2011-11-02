CallSmith.Views.ListContacts ||= {}

class CallSmith.Views.ListContacts.ShowView extends Backbone.View
	template: JST["backbone/templates/list_contacts/show"]
	className: "ListContacts-ShowView"
			
	events:
		'click': 'selectContact'

	initialize: (options) ->
		_.bindAll(this, 'selectContact', 'render')

	render: ->
		$(this.el).html(@template(@model.get("contact").toJSON()))
		return this
		
	selectContact: ->
		window.AppInstance.setSelectedContact(@model.get("contact"))
		$('.ListContacts-ShowView').removeClass('selected')
		$(this.el).addClass('selected')
		return this