
class UserController

    constructor: (@sys)->

    list: (req, res)=>
        res.send("respond with a resource")

    init: ()->
        @sys.app.get '/users', @list

module.exports = UserController