// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'text!templates/photo/photo-page.html'], function(View, template) {
  var PhotoPageView, _ref;
  return PhotoPageView = (function(_super) {
    __extends(PhotoPageView, _super);

    function PhotoPageView() {
      _ref = PhotoPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PhotoPageView.prototype.autoRender = true;

    PhotoPageView.prototype.template = template;

    template = null;

    return PhotoPageView;

  })(View);
});
