http = require 'http'
configuration = require './../../../configuration'

configureCommonFindController = (multibookerObject, multibookerPrimaryKey) ->
	controller = (request, response) ->
		requestObject =
			command: 'get'
			object: multibookerObject
			order_by: (request.query.sortby or multibookerPrimaryKey) + ' ' + (request.query.sort or 'desc')
			page_no: request.query.page or 1
			rows_max_num: request.query.limit or 10
		conditions = []
		for key, value of request.query
			switch key
				when 'page', 'limit', 'sortby', 'sort' then continue
				else
					lastchar = key[key.length - 1]
					key = key.slice(0, -1)
					switch lastchar
						when '*' then conditions.push "upper(#{key}) like upper('%#{value}%')"
						when '>' then conditions.push "#{key} > '#{value}'"
						when '<' then conditions.push "#{key} < '#{value}'"
						else conditions.push "#{key} = '#{value}'"
		if conditions.length then requestObject.where = conditions.join ' and '
		url = configuration.composeMultibookerRequestString requestObject
		console.log url
		multibookerRequest = http.get url, (multibookerResponse) ->
			multibookerResponse.setEncoding 'utf8'
			multibookerResponse.pipe response
		request.pipe multibookerRequest
	return controller

module.exports = configureCommonFindController