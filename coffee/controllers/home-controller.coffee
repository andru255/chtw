define [
  'config'
  'chaplin'
  'controllers/base/controller'
  'models/base/collection'
  'models/photo'
  'views/photo-page-view'
  ], (Config, Chaplin, Controller, Collection, Photo, PhotoPageView)->
  'use strict'

  class HomeController extends Controller
    show:(params)->
      console.log 'show'

    photo:(params)->
      console.log params

      console.info Chaplin.mediator.photosView

      @photoDetailView = new PhotoPageView
        region: 'rightSide'
