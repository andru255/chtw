define [
  'controllers/base/controller'
  'models/photos'
  'views/hello-world-view'
], (Controller, Photos, HelloWorldView) ->
  'use strict'

  class HelloController extends Controller
    show: (params) ->
      @model = new Photos()
      @view = new HelloWorldView
        containerMethod: 'html'
        model: @model
        region: 'main'

      fetch = @model.fetch()
      fetch.error((e)->
        #muestra los arguments del mismo fetch
        console.log arguments
      ).then((data)->
        #aqui a parsear..
        console.log "Wuju! exitoso!"
        console.log data.stat
      ).always(->
        #sea error o no igual se ejecuta aqui una funcion
        #mas info.
        #http://railsadventures.wordpress.com/2012/09/02/backbone-js-models-save-always-callback/
      )
