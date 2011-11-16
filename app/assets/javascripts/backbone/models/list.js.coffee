class CallSmith.Models.List extends Backbone.RelationalModel
	paramRoot: 'list'
	listContacts: null
	
	initialize: ->
		@listContacts = new CallSmith.Collections.ListContactsCollection()
		@listContacts.url = '/lists/' + @id + '/list_contacts'
		@listContacts.fetch()
		
	connectURL: ->
		@url() + "/connect"
		
	nextURL: ->
		@url() + "/next"
		
	cancelURL: ->
		@url() + "/cancel"
		
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
		)
	
	next: (callback = null) ->
		$.post(@nextURL(), {}, (data) ->
			if callback then callback()
		, "json")
	    .error((x,e) ->
			alert("ERROR")
		)
	
	cancel: (callback = null) ->
		$.post(@cancelURL(), {}, (data) ->
			if callback then callback()
		, "json")
	    .error((x,e) ->
			alert("ERROR")
		)
		
		

class CallSmith.Collections.ListsCollection extends Backbone.Collection
	model: CallSmith.Models.List
	url: '/lists'