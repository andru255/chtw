// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model', 'config'], function(Chaplin, Model, Config) {
  'use strict';
  var PhotoDetail, _ref;
  return PhotoDetail = (function(_super) {
    __extends(PhotoDetail, _super);

    function PhotoDetail() {
      _ref = PhotoDetail.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    return PhotoDetail;

  })(Model);
});