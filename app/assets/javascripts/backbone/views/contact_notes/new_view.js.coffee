CallSmith.Views.ContactNotes ||= {}

class CallSmith.Views.ContactNotes.NewView extends Backbone.View    
	template: JST["backbone/templates/contact_notes/new"]
	className: "ContactNotes-NewView"

	events:
		"submit #new-contact_note": "save"

	constructor: (options) ->
		super(options)
		@model = new @collection.model()

		@model.bind("change:errors", () =>
		this.render()
		)

	save: (e) ->
		e.preventDefault()
		e.stopPropagation()

		@model.unset("errors")

		@collection.create(@model.toJSON(), 
			success: (contact_note) =>
				@model = contact_note

			error: (contact_note, jqXHR) =>
				@model.set({errors: $.parseJSON(jqXHR.responseText)})
		)

	render: ->
		$(this.el).html(@template(@model.toJSON() ))

		this.$("form").backboneLink(@model)

		return this