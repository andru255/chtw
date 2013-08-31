define [
  'config'
  'controllers/base/controller'
  'models/photo'
  'views/photos-collection-view'
  'models/base/collection'
], (Config, Controller, Photo, PhotosCollectionView, Collection) ->
  'use strict'

  class HelloController extends Controller

    show: (params) ->

      ###
      #@model = new Photos()
      #@view = new HelloWorldView
      #  containerMethod: 'html'
      #  model: @model
      #  region: 'main'

      #fetch = @model.fetch()
      #fetch.error((e)->
      #  #muestra los arguments del mismo fetch
      #  console.log arguments
      #).then((data)->
      #  #aqui a parsear..
      #  console.log "Wuju! exitoso!"
      #  console.log data.stat
      #).always(->
      #  #sea error o no igual se ejecuta aqui una funcion
      #  #mas info.
      #  #http://railsadventures.wordpress.com/2012/09/02/backbone-js-models-save-always-callback/
      #)
      ###

      ###
        http://dailyjs.com/2012/12/27/backbone-tutorial-5/
      ###
      #@photos = new Collection null, model: Photo
      #@photos.url = @model.url()
      #@photosView = new

      #@photo = new Photo
      #@photos = new Collection null, model: Photo
      #@photos.url = @photo.url()

      #@photosView = new PhotosCollectionView collection:@photos, region:'main'
      #@photos.fetch().then @photosView.render
      #console.log @photosView
      #.then @photosView.render
      @photos = new Collection null, model: Photo
      @photos.url = Config.urlList
      @photos.parse = (response)->
        response.photos.photo

      @photosView = new PhotosCollectionView collection:@photos, region:'main'

      @photos.fetch().then =>
        console.log arguments
        console.log @photosView

    photo:(params)->
      console.log params
