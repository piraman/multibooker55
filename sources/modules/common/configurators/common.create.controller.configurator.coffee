http = require 'http'
extend = require 'extend'
configuration = require './../../../configuration'

configureCommonCreateController = (multibookerObject, multibookerPrimaryKey) ->
	controller = (request, response) ->
		requestObject =
			command: 'new'
			object: multibookerObject
		requestObject = extend requestObject, request.body
		url = configuration.composeMultibookerRequestString requestObject
		console.log url
		multibookerRequest = http.get url, (multibookerResponse) ->
			multibookerResponse.setEncoding 'utf8'
			multibookerResponse.pipe response
		request.pipe multibookerRequest
	return controller

module.exports = configureCommonCreateController