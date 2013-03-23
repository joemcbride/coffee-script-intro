#/**
 # * Module dependencies.
 # */

express      = require 'express'
routes       = require './routes'
http         = require 'http'
Controllers  = require './controllers'
coffeepot    = require 'coffeepot'
app = express()

app.configure ->
    app.set('port', process.env.PORT || 3000)
    app.set('views', __dirname + '/views')
    app.set('view engine', 'jade')
    app.use(express.favicon())
    app.use(express.logger('dev'))
    app.use(express.bodyParser())
    app.use(express.methodOverride())
    app.use(express.cookieParser('your secret here'))
    app.use(express.session())

    app.use app.router

    publicDir = __dirname + '/public'
    app.use coffeepot publicDir
    app.use express.static publicDir

app.configure 'development', ()->
    app.use express.errorHandler()

app.controllers = new Controllers
    app: app

app.controllers.initRoutes()

app.get('/', routes.index)

module.exports = app
