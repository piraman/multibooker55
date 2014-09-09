http = require 'http'
extend = require 'extend'
configuration = require './../../../configuration'

configureCommonDeleteController = (multibookerObject, multibookerPrimaryKey) ->
	controller = (request, response) ->
		requestObject =
			command: 'remove'
			object: multibookerObject
			objversion: request.query.objversion
		requestObject[multibookerPrimaryKey] = request.params.id
		url = configuration.composeMultibookerRequestString requestObject
		console.log url
		multibookerRequest = http.get url, (multibookerResponse) ->
			multibookerResponse.setEncoding 'utf8'
			multibookerResponse.pipe response
		request.pipe multibookerRequest
	return controller

module.exports = configureCommonDeleteController
