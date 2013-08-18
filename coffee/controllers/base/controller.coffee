define [
    'chaplin'
    'views/site-view'
    'views/header-view'
    'models/navigation'
    'views/navigation-view'
  ], (Chaplin, SiteView, HeaderView, Navigation, NavigationView) ->
  'use strict'

  class Controller extends Chaplin.Controller
    # Place your application-specific controller features here
    beforeAction: (params, route)->
      @compose 'site', SiteView
      @compose 'header', HeaderView
      @compose 'auth', ->
        SessionController = require 'Controllers/session-controller'
        @controller = new SessionController

      if route.name in ['users#show', 'repos#show', 'topics#show']
        @compose 'navigation', ->
          @model = new Navigation
          @view = new NavigationView {@model}
