currentPresentationRenderId = 0
markdown = new Markdown.Converter()
impressAPI = null

nextSlide = ->
	if impressAPI?
		impressAPI.next()
prevSlide = ->
	if impressAPI?
		impressAPI.prev()
updateRender = (editMode=true)->
	[globalOptions, slides] = window.parse($("#edit").val())
	build = []
	x=0
	y=0
	for slide in slides
		[options, body] = slide
		classes = " slide "
		#if option['slide']
			#classes = classes + " slide"
		if options['title']
			classes += " titleslide "
		if options['no-background']
			classes += " no-background "
		if options['two-column']
			classes += " two-column "
		if options['border']
			classes += " two-column "
		if options['class']
			classes += " " + options['class'].split(',').join(' ')
			
		attributes = ""
		if options['id']?
			attributes += " id=#{options['id']}"

		if options['x']?
			x = options['x']
		if options['y']?
			y = options['y']

		scale = 1
		if options['scale']?
			scale = options['scale']


		build.push "<div class='step#{classes}' data-x = '#{x}' data-y='#{y}' data-scale='#{scale}'>"
		console.log body
		build.push markdown.makeHtml(body)
		build.push '</div>'
		x+=1024
	currentPresentationRenderId += 1
	$(".render")
		.remove()
	renderWidth = $("#rightpane").width()
	renderHeight = $("#rightpane").height()
	$(".renderbase")
		.clone()
		.removeClass("renderbase")
		.addClass("render")
		.attr("id", "impress#{currentPresentationRenderId}")
		.attr("data-screen-width", renderWidth)
		.attr("data-screen-height", renderHeight)
		.html(build.join(''))
		.show()
		.appendTo($(".renderbase").parent())

	if globalOptions['no-transition']
		$(".render").attr("data-transition-duration","0")

	impressAPI = impress("impress#{currentPresentationRenderId}")
	impressAPI.init(editMode)
	MathJax.Hub.Queue(["Typeset",MathJax.Hub,"impress#{currentPresentationRenderId}"])
	$("#prevSlide")
		.unbind()
		.click(prevSlide)
	$("#nextSlide")
		.unbind()
		.click(nextSlide)

$(document).ready ->
	fixedHeight = ($("#container").height()-100)
	$("#edit")
		.height(fixedHeight)
		.val(window.sample)
	$(".renderbase")
		.height(fixedHeight)
	$(".renderparent")
		.height(fixedHeight)
	updateRender()
	$("#checkpreviewmode")
		.click ->
			if not $(this).is(":checked")
				$("#leftpane").show()
				$("#rightpane").removeClass('span12')
				$("#rightpane").addClass('span7')
				updateRender(true)
				$(".render").addClass('editmode')
			else
				$("#leftpane").hide()
				$("#rightpane").removeClass('span7')
				$("#rightpane").addClass('span12')
				updateRender(true)
				$(".render").removeClass('editmode')

	$("#refreshBtn")
		.click(->
			updateRender()
		)
