// Generated by CoffeeScript 1.6.3
var __slice = [].slice;

define(['handlebars', 'chaplin', 'lib/utils'], function(Handlebars, Chaplin, utils) {
  'use strict';
  Handlebars.registerHelper('url', function() {
    var options, params, routeName, _i;
    routeName = arguments[0], params = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), options = arguments[_i++];
    return Chaplin.helpers.reverse(routeName, params);
  });
  return Handlebars.registerHelper("debug", function(optionalValue) {
    console.log("Current Context::");
    console.log(this);
    if (optionalValue) {
      console.log("Value::");
      return console.log(optionalValue);
    }
  });
});
