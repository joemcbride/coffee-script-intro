# Include the CoffeeScript interpreter so that .coffee files will work
coffee = require 'coffee-script'
http = require 'http'

# Include our application file
app = require './app'

# Start the server
http.createServer(app).listen app.get('port'), ()->
    console.log "Express server listening on port " + app.get('port')
