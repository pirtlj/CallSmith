class CallSmith.Models.ListContact extends Backbone.RelationalModel
	paramRoot: 'list_contact'
	
	defaults:
		list_id: null
		contact_id: null

	relations: [
		type: Backbone.HasOne,
		key: "contact"
		relatedModel: 'CallSmith.Models.Contact'
		reverseRelation:
			key: 'contact'
			type: Backbone.HasMany
		]
		
class CallSmith.Collections.ListContactsCollection extends Backbone.Collection
	model: CallSmith.Models.ListContact
	url: '/list_contacts.json'