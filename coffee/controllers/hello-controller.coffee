define [
  'controllers/base/controller'
  'models/photos'
  'models/photos-collection'
  'views/photos-collection-view'
  'models/base/collection'
], (Controller, Photo, PhotosCollection, PhotosCollectionView, Collection) ->
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

      @photo = new Photo
      @photos = new Collection null, model: Photo
      @photos.url = @photo.url()
      @photos.parse = (response)->
        return response.photos.photo

      @photosView = new PhotosCollectionView collection:@photos, region:'main'
      
      @photos.fetch().then =>
        console.log arguments
        console.log @photosView
