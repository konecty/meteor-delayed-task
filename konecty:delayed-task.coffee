new class DelayedTask 
	timer = null
	count = 0

	constructor: (@fn, @time=500, @flushCount=0, @args...) ->
		return @

	run: (args...) ->
		self = @

		Tracker.nonreactive ->
			if args.length > 0
				throw new Error '[DelayedTask] Tasks can\'t be called with arguments'

			if timer?
				Meteor.clearTimeout timer

			count++

			call = ->
				count = 0
				self.fn.apply self, self.args

			if self.flushCount > 0 and count >= self.flushCount
				return call()

			timer = Meteor.setTimeout call, self.time