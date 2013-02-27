environment = exports ? window

environment.parse = (input)->
	rootOption = {}
	if input.length > 2 and input[0] == ':' and input[1] == ':'
			input = input.split('\n')
			for optionKV in input.shift().substring(2).split(' ')
				res = optionKV.split(':')
				if res.length == 2
					[k,v] = res
					rootOption[k] = v
				else
					rootOption[optionKV] = true
			input = input.join('\n')

	slides = input.split('\n---\n')
	parsed = for slide in slides
		options = []
		if slide[0] == ':'
			slide = slide.split('\n')
			options = {}
			for optionKV in slide.shift().substring(1).split(' ')
				res = optionKV.split(':')
				if res.length == 2
					[k,v] = res
					options[k] = v
				else
					options[optionKV] = true
			slide = slide.join('\n')
		#console.log "options: ", options
		#console.log slide
		#console.log '********************************************************************************'
		[options, slide]
	[rootOption, parsed]
