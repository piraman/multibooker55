express = require 'express'
server = do express

server.use (req, res, next) ->
	res.end 'ok'

server.listen 20000

