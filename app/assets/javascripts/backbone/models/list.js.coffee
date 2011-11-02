class CallSmith.Models.List extends Backbone.RelationalModel
	paramRoot: 'list'

	connectURL: ->
		@url() + "/connect"
		
	defaults:
		user_id: null
		name: null
		sid: null
		scheduled_for: null

	relations: [
			type: Backbone.HasMany,
			key: 'listContacts',
			relatedModel: 'CallSmith.Models.ListContact',
			includeInJSON: Backbone.Model.prototype.idAttribute,
			collectionType: 'CallSmith.Collections.ListContactsCollection',
			reverseRelation:
				key: 'list'
			]

	connect: (callback = null) ->		
		$.post(@connectURL(), {}, (data) ->
			if callback then callback()
		, "json")
	    .error((x,e) ->
			alert("ERROR")
		);
		
		

class CallSmith.Collections.ListsCollection extends Backbone.Collection
	model: CallSmith.Models.List
	url: '/lists'