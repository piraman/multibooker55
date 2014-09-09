configuration =
	port: 20000
	sid: 'bwPxKUPqWMoCTWQoolBnXdSkYnxudrYuQyTUQcKIBEMSjxBsHN'
	# multibookerHost: 'http://192.168.1.101'
	multibookerHost: 'http://109.107.177.142:1111'
	composeMultibookerRequestString: (requestObject) ->
		requestString = '/cgi-bin/b2e?request=<query>'
		for key, value of requestObject
			requestString += "<#{key}>#{value}</#{key}>"
		requestString += "<sid>#{configuration.sid}</sid>"
		requestString += '</query>'
		return configuration.multibookerHost + requestString

module.exports = configuration

# SPiraev/89883666991