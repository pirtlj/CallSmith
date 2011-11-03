class CallSmith.Models.Contact extends Backbone.RelationalModel
	paramRoot: 'contact'
	contactNotes: null
		
	relations: [
		type: 'HasMany',
		key: 'listContacts',
		relatedModel: 'CallSmith.Models.ListContact',
		reverseRelation:
			key: 'contact'
		]

	initialize: ->
		@contactNotes = new CallSmith.Collections.ContactNotesCollection()
		@contactNotes.url = '/contacts/' + @id + '/contact_notes'

		
class CallSmith.Collections.ContactsCollection extends Backbone.Collection
	model: CallSmith.Models.Contact
	url: '/contacts'