class CallSmith.Models.ContactNote extends Backbone.Model
  paramRoot: 'contact_note'

  defaults:
    contact_id: null
    text: null
  
class CallSmith.Collections.ContactNotesCollection extends Backbone.Collection
  model: CallSmith.Models.ContactNote
  url: '/contact_notes'