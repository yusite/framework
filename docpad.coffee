# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	collections:
		homePageLayout: ->
			@getCollection("documents").findAllLive({extension:"html"}).on "add", (page) ->
				page.setMetaDefaults({layout:"homepage"})
				iUrl = page.getMeta("titleIsPath")
				if iUrl
					theString = page.getMeta("title").replace /\s/g, "-"
					newUrl = theString + "/index.html"
					page.setMetaDefaults({outPath:newUrl})

		subpages: ->
			@getCollection("html").findAllLive({relativeOutDirPath:/\w+/})

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
