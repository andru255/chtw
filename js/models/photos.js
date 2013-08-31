// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var Photos, _ref;
  return Photos = (function(_super) {
    __extends(Photos, _super);

    function Photos() {
      _ref = Photos.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Photos.prototype.urlRoot = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=13b48fc6b63cb9293e7f4f24bab019b8&tags=cat&format=json&nojsoncallback=1&api_sig=ad57f0df1f2f3ca4465f61180a7fe47d";

    Photos.prototype.defaults = {
      message: 'ey!'
    };

    return Photos;

  })(Model);
});
