define [
  'handlebars'
  'chaplin'
  'lib/utils'
], (Handlebars, Chaplin, utils) ->
  'use strict'

  # Application-specific Handlebars helpers
  # ---------------------------------------

  # Get Chaplin-declared named routes. {{#url "like" "105"}}{{/url}}
  Handlebars.registerHelper 'url', (routeName, params..., options) ->
    Chaplin.helpers.reverse routeName, params

  Handlebars.registerHelper "debug", (optionalValue) ->
    console.log "Current Context::"
    console.log this
    if optionalValue
      console.log "Value::"
      console.log optionalValue
