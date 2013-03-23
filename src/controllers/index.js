// Generated by CoffeeScript 1.4.0
(function() {
  var Controllers, fs, path,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  fs = require('fs');

  path = require('path');

  Controllers = (function() {

    function Controllers(sys) {
      this.sys = sys;
      this.initRoutes = __bind(this.initRoutes, this);

      this.controller = __bind(this.controller, this);

      this.sys.controller = this.controller;
      this.controller_cache = {};
    }

    Controllers.prototype.controller = function(name) {
      var controller, filepath;
      if (typeof this.controller_cache[name] === 'undefined') {
        filepath = path.join(__dirname, name) + '_controller.coffee';
        controller = require(filepath);
        this.controller_cache[name] = new controller(this.sys);
      }
      return this.controller_cache[name];
    };

    Controllers.prototype.initRoutes = function() {
      var _this = this;
      return fs.readdir(__dirname, function(err, files) {
        var controller, file, name, _i, _len;
        for (_i = 0, _len = files.length; _i < _len; _i++) {
          file = files[_i];
          name = file.split('.').shift().split('_').shift();
          if (name === 'index') {
            continue;
          }
          controller = _this.controller(name);
          if (typeof controller.init === "function") {
            controller.init();
          }
        }
      });
    };

    return Controllers;

  })();

  module.exports = Controllers;

}).call(this);