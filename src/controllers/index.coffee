fs = require 'fs'
path = require 'path'

class Controllers
    constructor: (@sys) ->
        @sys.controller = @controller
        @controller_cache = {}

    controller: (name) =>
        if typeof @controller_cache[name] == 'undefined'
            filepath = path.join(__dirname, name) + '_controller.coffee'
            controller = require filepath
            @controller_cache[name] = new controller(@sys)

        return @controller_cache[name]

    initRoutes: =>
        fs.readdir __dirname, (err, files) =>

            for file in files
                name = file.split('.').shift().split('_').shift()

                continue if name in ['index']

                controller = @controller(name)
                controller.init?()
            return

module.exports = Controllers