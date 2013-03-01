environment = exports ? window

environment.parse = (input)->
	rootOptions = {}

	slides = input.split('\n---\n')
	parsed = for slide in slides
		options = []
		while slide[0] == ':'
			slide = slide.split('\n')
			options = {}
			for optionKV in slide.shift().substring(1).split(' ')
				res = optionKV.split(':')
				if res[0] == 'global'
					if res.length >= 3
						rootOptions[res[1]] = res[2]
					else
						rootOptions[res[1]] = true
				else if res.length >= 2
					options[res[0]] = res[1]
				else
					options[optionKV] = true
			slide = slide.join('\n')
		#console.log "options: ", options
		#console.log slide
		#console.log '********************************************************************************'
		[options, slide]
	[rootOptions, parsed]
