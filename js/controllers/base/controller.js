// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['config', 'chaplin', 'views/site-view', 'views/header-view', 'models/base/collection', 'models/photo', 'views/photos-collection-view'], function(Config, Chaplin, SiteView, HeaderView, Collection, Photo, PhotosCollectionView) {
  'use strict';
  var Controller, _ref;
  return Controller = (function(_super) {
    __extends(Controller, _super);

    function Controller() {
      _ref = Controller.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Controller.prototype.beforeAction = function(params, route) {
      this.compose('site', SiteView);
      this.compose('header', HeaderView);
      return this.compose('navigation', function() {
        var _this = this;
        this.photos = new Collection(null, {
          model: Photo
        });
        this.photos.url = Config.urlList;
        this.photos.parse = function(response) {
          return response.photos.photo;
        };
        this.photosView = new PhotosCollectionView({
          collection: this.photos,
          region: 'leftSide'
        });
        return this.photos.fetch().then(function() {
          console.log(arguments);
          return console.log(_this.photosView);
        });
      });
    };

    return Controller;

  })(Chaplin.Controller);
});
