cs = require 'coffee-script'
path = require 'path'
fs = require 'fs'

# should I change it to try using the .js versions instead? how will it know?
# yes, use the .js versions. Independent of stuffz

module.exports = coffeepot = (publicDir) ->
  handler = (req, res, next) ->
    return next() if not req.url.match /.js$/

    coffeeUrl = req.url.replace /.js$/, ".coffee"
    file = path.join publicDir, coffeeUrl

    path.exists file, (exists) ->
      if !exists then return next()

      fs.readFile file, (err, data) ->
        if err? then return res.send err.message, 500

        try
          content = cs.compile data.toString()
        catch err
          return res.send err.message, 500

        res.header 'Content-Type', 'text/javascript'
        res.send content
