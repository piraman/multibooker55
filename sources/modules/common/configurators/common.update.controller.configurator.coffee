http = require 'http'
extend = require 'extend'
configuration = require './../../../configuration'

configureCommonUpdateController = (multibookerObject, multibookerPrimaryKey) ->
	controller = (request, response) ->
		requestObject =
			command: 'modify'
			object: multibookerObject
		requestObject[multibookerPrimaryKey] = request.params.id
		requestObject = extend requestObject, request.body
		url = configuration.composeMultibookerRequestString requestObject
		console.log url
		multibookerRequest = http.get url, (multibookerResponse) ->
			multibookerResponse.setEncoding 'utf8'
			multibookerResponse.pipe response
		request.pipe multibookerRequest
	return controller

module.exports = configureCommonUpdateController
