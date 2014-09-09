express = require 'express'
server = do express
formy = require 'formidable'
configuration = require './configuration'
configureRoutes = require './routes'

server.use (req, res, next) ->
	form = new formy.IncomingForm
	form.parse req, (err, fields, files) ->
		if err then throw err
		req.body = fields
		req.files = files
		do next

configureRoutes server

server.listen configuration.port

