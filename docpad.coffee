# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	collections:
		subpages: ->
			@getCollection("html").findAllLive({relativeDirPath:/\w+/}).on "add", (pages) ->
				pages.setMetaDefaults({layout:"homepage"})

	templateData:
		site:
			url: "http://localhost:9778"
			title: "Default Title"
			description: "your description"
			keywords: "keywords here"

		getPreparedTitle: ->
			if @document.title
				"#{@document.title} | #{@site.title}"
			else
				@site.title

		getPreparedPageTitle: ->
			@document.title or @site.title

		getPreparedDescription: ->
			@document.description or @site.description

		getPreparedKeywords: ->
			@site.keywords.concat(@document.keywords or []).join(', ')
}

# Export the DocPad Configuration
module.exports = docpadConfig
