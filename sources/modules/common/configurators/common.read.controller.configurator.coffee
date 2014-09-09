http = require 'http'
configuration = require './../../../configuration'

configureCommonReadController = (multibookerObject, multibookerPrimaryKey) ->
	controller = (request, response) ->
		requestObject =
			command: 'get'
			object: multibookerObject
			where: "#{multibookerPrimaryKey} = #{request.params.id}"
		url = configuration.composeMultibookerRequestString requestObject
		console.log url
		multibookerRequest = http.get url, (multibookerResponse) ->
			multibookerResponse.setEncoding 'utf8'
			multibookerResponse.pipe response
		request.pipe multibookerRequest
	return controller

module.exports = configureCommonReadController
