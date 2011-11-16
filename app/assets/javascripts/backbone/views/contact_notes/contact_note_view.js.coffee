CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.ContactNoteView extends Backbone.View
	template: JST["backbone/templates/contact_notes/contact_note"]

	events:
		"click .destroy" : "destroy"

	tagName: "tr"

	destroy: () ->
		@model.destroy()
		this.remove()

		return false

	render: ->
		json = @model.toJSON()
		json["date"] = @model.get("created_at").split("T")[0]
		
		$(this.el).html(@template(json))    
		return this