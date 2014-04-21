# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	templateData:
		site:
			url: "http://yuz.me"
			title: "Default Title"
			description: "your description"
			keywords: "keywords here"

		getPreparedTitle: ->
			if @document.title
				"#{@document.title} | #{@site.title}"
			else
				@site.title

		getPreparedDescription: ->
			@document.description or @site.description

		getPreparedKeywords: ->
			@site.keywords.concat(@document.keywords or []).join(', ')
}

# Export the DocPad Configuration
module.exports = docpadConfig