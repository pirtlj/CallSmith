class CallSmith.Models.List extends Backbone.RelationalModel
  paramRoot: 'list'

  defaults:
    user_id: null
    name: null
    sid: null
    scheduled_for: null

  relations: [
        {
            type: Backbone.HasMany,
            key: 'listContacts',
            relatedModel: 'CallSmith.Models.ListContact',
            includeInJSON: Backbone.Model.prototype.idAttribute,
            collectionType: 'CallSmith.Collections.ListContactsCollection',
            reverseRelation: {
                key: 'list'
            }
        }
    ]

  
class CallSmith.Collections.ListsCollection extends Backbone.Collection
  model: CallSmith.Models.List
  url: '/lists'