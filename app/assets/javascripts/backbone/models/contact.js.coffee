class CallSmith.Models.Contact extends Backbone.RelationalModel
  paramRoot: 'contact'

  defaults:
    phone_number: null
    first_name: null
    last_name: null

  relations: [
        {
            type: 'HasMany',
            key: 'listContacts',
            relatedModel: 'CallSmith.Models.ListContact',
            reverseRelation: {
                key: 'contact'
            }
        }
    ]

class CallSmith.Collections.ContactsCollection extends Backbone.Collection
  model: CallSmith.Models.Contact
  url: '/contacts'