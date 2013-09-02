define [
  'chaplin'
], (Chaplin) ->
  'use strict'

  # The application object.
  # Choose a meaningful name for your application.
  class Application extends Chaplin.Application
    title: 'Chaplin example application'

    #creando propiedades adicionales con el mediator
    initMediator:->
      Chaplin.mediator.photos = null
      super
